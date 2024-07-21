package controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.OperaBean;
import model.OperaDAO;

@WebServlet(name = "AggiungiOperaServlet", urlPatterns = { "/aggiungiOpera" }, initParams = {
        @WebInitParam(name = "aggiungi-opera", value = "img") })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB dopo il quale il file verrà temporaneamente salvato su disco
        maxFileSize = 1024 * 1024 * 10, // 10MB dimensione massima consentita per i file caricati
        maxRequestSize = 1024 * 1024 * 50) // 50MB dimensione complessiva di tutti i file caricati

public class AggiungiOperaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static String SAVE_DIR = "";

    public void init() throws ServletException {
        SAVE_DIR = getServletConfig().getInitParameter("aggiungi-opera");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    		
    	HttpSession session = request.getSession();
    	if (session.getAttribute("role") == null || !session.getAttribute("role").equals("admin")) {
            request.setAttribute("message", "Questa pagina è accessibile solo agli admin");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/error.jsp");
            rd.forward(request, response);
            return;
        }
    	
        try {
            String nome = request.getParameter("nome");
            String prezzoStr = request.getParameter("prezzo");
            String stile = request.getParameter("stile");
            String artista = request.getParameter("artista");
            String dataStr = request.getParameter("data");
            String descrizione = request.getParameter("descrizione");
            Part filePart = request.getPart("immagine");

            String fileName = extractFileName(filePart);
            String savePath = getServletContext().getRealPath("") + File.separator + SAVE_DIR;
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }
            filePart.write(savePath + File.separator + fileName);

            // Leggi il file come array di byte
            byte[] immagineBytes = extractBytesFromFile(new File(savePath + File.separator + fileName));

            // Conversione del prezzo da stringa a double
            double prezzo = 0.0;
            try {
                prezzo = Double.parseDouble(prezzoStr);
            } catch (NumberFormatException e) {
                throw new ServletException("Formato del prezzo non valido", e);
            }

            // Conversione della data da stringa a oggetto Date
            Date data;
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date parsedDate = sdf.parse(dataStr);
                data = new Date(parsedDate.getTime());
            } catch (ParseException e) {
                throw new ServletException("Formato della data non valido", e);
            }

            // Creazione del bean OperaBean con i dati ottenuti
            OperaBean nuovaOpera = new OperaBean(nome, prezzo, stile, artista, data, immagineBytes, descrizione);

            // Salvataggio nel database tramite OperaDAO
            OperaDAO operaDAO = new OperaDAO();
            operaDAO.doSave(nuovaOpera);
            response.sendRedirect(request.getContextPath() + "/view/aggiungiOpera.jsp");
        } catch (SQLException e) {
            handleException(request, response, "Errore durante l'inserimento dell'opera nel database");
        } catch (ServletException e) {
            handleException(request, response, e.getMessage());
        } catch (IOException e) {
            handleException(request, response, "Errore durante la lettura del file");
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    private byte[] extractBytesFromFile(File file) throws IOException {
        FileInputStream fis = new FileInputStream(file);
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        byte[] buf = new byte[1024];
        try {
            for (int readNum; (readNum = fis.read(buf)) != -1;) {
                bos.write(buf, 0, readNum);
            }
        } catch (IOException e) {
            throw new IOException("Errore durante la lettura del file", e);
        }
        byte[] bytes = bos.toByteArray();
        fis.close();
        bos.close();
        return bytes;
    }

    
    private void handleException(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
        request.setAttribute("message", message);
        request.getRequestDispatcher("/view/error.jsp").forward(request, response);
    }
}
