
<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>	
		<div class="container">
	<h2 style="text-align:center; color: #ff69b4; margin-top: 20px;">
  Welcome back,  Ready to slay your tasks today?
</h2>
	<div style="background:#fff0f5; border-radius:15px; padding:20px; text-align:center; margin:20px auto; max-width:600px; box-shadow:0 0 10px pink;">
  <p style="font-size: 1.2em;">Small progress is still progress. Keep going</p>
  
  <div style="text-align: center; margin: 30px;">
  <button onclick="window.location.href='/list-todos'" style="padding: 10px 20px; font-size: 16px; background: #ffb6c1; border: none; border-radius: 25px; box-shadow: 0 4px 8px #ffb6c1; color: white;">
    Add New Task
  </button>
</div>
  <div id="clock" style="text-align:center; font-size:20px; color:#ff69b4; margin-top:15px;">
  ⏰ Loading time...
</div>
	<div style="text-align:center;">
  <img src="https://cdn-icons-png.flaticon.com/512/616/616408.png" width="100" alt="cat mascot"/>
  <p style="color:#d96ebc;">I am here to cheer you on! </p>
</div>
	<h1 style="text-align:center;
  font-size: 2.5em;
  background: linear-gradient(to right, #ff6ec4, #7873f5);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  margin-top: 20px;">
   Your Magical To-Do World
</h1>
	
	</div>
<script>
  function updateClock() {
    const now = new Date();
    document.getElementById("clock").innerHTML =
      `⏰ ${now.toLocaleTimeString()} | 🗓️ ${now.toLocaleDateString()}`;
  }
  setInterval(updateClock, 1000);
  updateClock();
</script>
 <style>
  .bubble {
    position: absolute;
    border-radius: 50%;
    background: rgba(255,182,193,0.3);
    width: 40px;
    height: 40px;
    animation: float 6s ease-in infinite;
  }

  @keyframes float {
    0% { transform: translateY(0); }
    100% { transform: translateY(-800px); }
  }
</style>

<script>
  for (let i = 0; i < 10; i++) {
    const b = document.createElement('div');
    b.className = 'bubble';
    b.style.left = Math.random() * window.innerWidth + 'px';
    b.style.bottom = '-50px';
    b.style.width = b.style.height = Math.random() * 20 + 20 + 'px';
    document.body.appendChild(b);
  }
</script>

  
</div>
	
	<%@ include file="common/footer.jspf" %>


