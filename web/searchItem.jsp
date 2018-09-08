<form method="GET" action="searchController.jsp">
        <label for="search">Search: </label>
        <select id="selection" onchange="clickIt()">
           <option value="title">Title</option>
            <option value="genre">Genre</option>
           <option value="rYear">Release Year</option>
        </select>
        <input type="text" id="inputIt" name="search" placeholder="Search By Title . . .">
        <div id="dates" style="display: none">
            From: <input type="date" name="fromDate"> to: <input type="date" name="toDate">
        </div>
        <button type="submit">Search</button>
   </form>

<script>
    function clickIt() {
        var selection = document.getElementById("selection");
        var value = selection.value;
        if(value === "title"){
            document.getElementById("inputIt").style.display = "inline"; 
            var input = document.getElementById("inputIt");
            input.placeholder = "Search By Title . . .";
            document.getElementById("dates").style.display = "none"; 
        } else if (value === "genre"){
            document.getElementById("inputIt").style.display = "inline"; 
            var input = document.getElementById("inputIt");
            input.placeholder = "Search By Genre . . .";
            document.getElementById("dates").style.display = "none"; 
            
        } else if (value === "rYear") {
            document.getElementById("inputIt").style.display = "none"; 
            document.getElementById("dates").style.display = "inline"; 
        }
    }
    
</script>