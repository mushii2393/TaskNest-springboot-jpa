
<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>

<div class="container">
    <h1>Your Todos</h1>
<div class="btn-group mb-3" role="group">
    <button class="btn btn-outline-primary" onclick="filterTodos('all')">All</button>
   <button class="btn btn-outline-success" onclick="filterTodos('completed')">Completed</button>
   <button class="btn btn-outline-warning" onclick="filterTodos('pending')">Pending</button>
</div>

    <table class="table">
        <thead>
            <tr>
                <th>Description</th>
                <th>Target Date</th>
                <th>Is Done?</th>
                <th>Actions</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
      
           <c:forEach items="${todos}" var="todo">
   <tr class="todo-row ${todo.done ? 'completed' : 'pending'}">
       <td>
           <input 
               type="checkbox" 
               class="todo-check" 
               onchange="toggleStatus(this, ${todo.id})"
               ${todo.done ? 'checked' : ''} />
       </td>
       <td><c:out value="${todo.description}" /></td>
       <td><c:out value="${todo.targetDate}" /></td>
       <td>
           <!-- Actions -->
           <a href="update-todo?id=${todo.id}" class="btn btn-sm btn-primary">Update</a>
           <a href="#" onclick="confirmDelete(${todo.id})" class="btn btn-sm btn-danger">Delete</a>
       </td>
   </tr>
   <div id="loading-spinner" style="display: none;" class="text-center mt-5">
    <img src="https://cdn-icons-png.flaticon.com/512/833/833472.png" width="80" />
    <p>Loading todos...</p>
</div>
    
</c:forEach>
          
       </tbody>
       <tbody>
       <c:forEach items="${todos}" var="todo">
           <c:if test="${todo.done}">
               <tr class="table-success">
                   <td><s>${todo.description}</s></td>
                   <td>${todo.targetDate}</td>
                   <td>${todo.done}</td>
                   <td>
                       <a href="delete-todo?id=${todo.id}" class="btn btn-danger btn-sm">Delete</a>
                       <a href="update-todo?id=${todo.id}" class="btn btn-secondary btn-sm">Update</a>
                   </td>
               </tr>
           </c:if>
       </c:forEach>
      <div id="loading-spinner" style="display: none;" class="text-center mt-5">
   <img src="https://media.giphy.com/media/0rVZ1fI5w3CcLLqU5a/giphy.gif" width="80" alt="Cat Paw Loader" />
   <p style="font-family: 'Comic Sans MS', cursive; color: #ff6f91;">Loading your todos... </p>
</div>


<script>
   document.addEventListener("DOMContentLoaded", () => {
       const table = document.querySelector("table");
       const spinner = document.getElementById("loading-spinner");
       spinner.style.display = "block";
       table.style.display = "none";

       setTimeout(() => {
           spinner.style.display = "none";
           table.style.display = "table";
       }, 400); // Cute delay
   });
</script>
              
    </tbody>
    </table>

    <div class="text-center mt-4">
        <a href="add-todo" class="btn btn-success">Add Todo</a>
    </div>
</div>
<c:if test="${empty todos}">
   <div class="text-center my-4">
       <img src="https://cdn-icons-png.flaticon.com/512/7486/7486800.png" width="120">
       <h5 class="mt-3 text-muted">You're all caught up! No todos left.</h5>
   </div>
</c:if>


<c:if test="${not empty successMessage}">
  <div class="alert alert-success" role="alert">
      ${successMessage}
       <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
</c:if>


<!-- Toast Container -->
<div class="toast-container position-fixed bottom-0 end-0 p-3">

    <c:if test="${not empty successMessage}">
       <div id="toastMessage" class="toast align-items-center text-bg-success border-0 mb-2" role="alert" aria-live="assertive" aria-atomic="true">
           <div class="d-flex">
               <div class="toast-body">
                   ${successMessage}
               </div>
               <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
           </div>
       </div>
   </c:if>
<c:set var="doneCount" value="0" />
<c:set var="totalCount" value="0" />
<c:forEach items="${todos}" var="todo">
  <c:set var="totalCount" value="${totalCount + 1}" />
  <c:if test="${todo.done}">
     <c:set var="doneCount" value="${doneCount + 1}" />
  </c:if>
</c:forEach>

<p class="task-progress mt-3"> ${doneCount} of ${totalCount} tasks completed! </p>

</div>

<script>
   window.addEventListener('DOMContentLoaded', (event) => {
       var toastEl = document.getElementById('toastMessage');
       if (toastEl) {
           var toast = new bootstrap.Toast(toastEl, {
               animation: true,
               autohide: true,
               delay: 3000 // disappears in 3 sec
           });
           toast.show();
       }
   });
</script>

<script>
function toggleStatus(checkbox, id) {
    $.post('/toggle-done?id=' + id, function(response) {
        if (response === 'success') {
            location.reload(); // Or do DOM update instead of reload for smoother UX
        }
    });
}
</script>

<script>
function filterTodos(filter) {
    $('.todo-row').show();

    if (filter === 'completed') {
        $('.todo-row').not('.completed').hide();
    } else if (filter === 'pending') {
        $('.completed').hide();
    }
}
</script>

<a href="add-todo" class="btn btn-success rounded-circle" id="floatingAddBtn" title="Add Todo">+</a>

<style>
#floatingAddBtn {
    position: fixed;
    bottom: 100px;
    right: 30px;
    font-size: 24px;
    width: 60px;
    height: 60px;
    padding: 0;
    text-align: center;
    line-height: 60px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

</style>
<div style="text-align:center; margin:20px;">
 <button onclick="giveCompliment()" style="background:#ffc0cb; border:none; padding:10px 20px; border-radius:20px; font-size:16px;">
   Compliment Me
 </button>
 <p id="compliment" style="margin-top:15px; font-size:18px; color:#d96ebc;"></p>
</div>

<script>
 const compliments = [
   "You're cuter than a kitten in a teacup!",
   "Your energy brightens up this site! ",
   "You're doing amazing, sweet bean! ",
   "Your to-dos are lucky to have you! "
 ];
 function giveCompliment() {
   const rand = compliments[Math.floor(Math.random() * compliments.length)];
   document.getElementById('compliment').innerText = rand;
 }
</script>

<%@ include file="common/footer.jspf" %>
