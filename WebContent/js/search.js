function showSuggestions(query) {
    if (query.length == 0) {
        document.getElementById("suggestions").innerHTML = "";
        document.getElementById("suggestions").style.display = "none";
        return;
    }
    
    const xhr = new XMLHttpRequest();
    xhr.open("GET", `<%= request.getContextPath() %>/searchServlet?query=` + encodeURIComponent(query), true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            const suggestions = JSON.parse(xhr.responseText);
            let suggestionsList = suggestions.map(s => `<div onclick="selectSuggestion('${s.nome}')">${s.nome}</div>`).join("");
            document.getElementById("suggestions").innerHTML = suggestionsList;
            document.getElementById("suggestions").style.display = "block";
        }
    };
    xhr.send();
}

function selectSuggestion(name) {
    document.getElementById("search-input").value = name;
    document.getElementById("suggestions").style.display = "none";
    searchArtwork();
}

function searchArtwork() {
    const query = document.getElementById("search-input").value;
    window.location.href = `<%= request.getContextPath() %>/home?search=` + encodeURIComponent(query);
}