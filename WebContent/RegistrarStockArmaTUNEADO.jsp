<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.LinkedList"%>

<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>[PSG] Registrar Stock Arma</title>
  <link rel="stylesheet" href="./dist/css/armasV.css">
  <style type="text/css">
    .btn-mensajes {
      color: #fff;
      background-color: #7460ee;
      border-color: #7460ee;
      font-size: 15px;
      padding: 5px;
      text-align: center;
      width: 100px;
      border-radius: 20px;
      position: relative;
      bottom: -400px;
      margin-top: 30px;
      left:370px;
    }   
  </style>
  <script src="//code.tidio.co/p26dt4g3heql4zxjwvkmcyecxl33ssqy.js" async></script>
</head>

<body>
	<% 
		 DataArma  da = new  DataArma();
		LinkedList<Arma> armas = da.getAll();
		
	%>
  <!-- partial:index.partial.html -->
  <div id="weapon-selector-wrapper">
    <a button class="btn-mensajes" class="btn btn-primary" href="homeTest.html">Home</a>
    <div id="weapon-properties">
      <h4>Daño</h4>
      <div class="bar">
        <div id="damage" class="value-bar"></div>
      </div>
      <h4>Cadencia</h4>
      <div class="bar">
        <div id="fire-rate" class="value-bar"></div>
      </div>
      <h4>Precisión</h4>
      <div class="bar">
        <div id="accuracy" class="value-bar"></div>
      </div>
      <h4>Rango</h4>
      <div class="bar">
        <div id="range" class="value-bar"></div>
      </div>
    </div>
    <svg height="620px" width="620px">
      <text text-anchor="middle" id="hovered-weapon-name" x="175" y="400" font-size="18" stroke="none">Seleccionar arma</text>
      <g onclick="changeCurrentWeaponWith(this)" 
        onmouseover="mouseoverWeapon(this)" 
        onmouseout="onmouseoutWeapon()" 
        
        data-weapon="Cantidad: -"
        
        
        data-image="https://vignette.wikia.nocookie.net/gtawiki/images/c/c8/MarksmanRifle-GTAVPC-HUD.png/revision/latest/scale-to-width-down/185?cb=20150419122123" 
        data-damage="90%" 
        data-fire-rate="80%" 
        data-accuracy="40%" 
        data-range="30%">
        <path d="M 610 310 A 300 300 0 0 1 522.1320343559643 522.1320343559643  L 451.4213562373095 451.4213562373095 A 200 200 0 0 0 510 310  z" fill="rgba(255,255,255,0.3)"/>
        <image xlink:href="https://vignette.wikia.nocookie.net/gtawiki/images/c/c8/MarksmanRifle-GTAVPC-HUD.png/revision/latest/scale-to-width-down/185?cb=20150419122123" x="240" y="460" height="200px" width="200px"/>
        <text x="250" y="620" font-size="18" fill="white">Marksman Rifle</text>
      </g>
      
      <g onclick="changeCurrentWeaponWith(this)" 
        onmouseover="mouseoverWeapon(this)" 
        onmouseout="onmouseoutWeapon()" 
        data-weapon="Cantidad: -" 
        data-image="https://www.vespura.com/fivem/weapons/images/WEAPON_AUTOSHOTGUN.png" 
        data-damage="70%" 
        data-fire-rate="45%" 
        data-accuracy="22%" 
        data-range="20%">
        <path d="M 522.1320343559643 522.1320343559643 A 300 300 0 0 1 310 610  L 310 510 A 200 200 0 0 0 451.4213562373095 451.4213562373095  z" fill="rgba(255,255,255,0.3)"/>
        <image xlink:href="https://www.vespura.com/fivem/weapons/images/WEAPON_AUTOSHOTGUN.png" x="105" y="610" height="60px" width="150px"/>
        <text x="90" y="690" font-size="18" fill="white">Sawed-Off Shotgun</text>
      </g>
      
      <g onclick="changeCurrentWeaponWith(this)" 
        onmouseover="mouseoverWeapon(this)" 
        onmouseout="onmouseoutWeapon()" 
        data-weapon="Cantidad: -" 
        data-image="https://vignette.wikia.nocookie.net/gtawiki/images/b/b4/SawedoffShotgun-GTAVPC-HUD.png/revision/latest/scale-to-width-down/185?cb=20150419121516" 
        data-damage="90%" 
        data-fire-rate="80%" 
        data-accuracy="40%" 
        data-range="30%">
        <path d="M 310 610 A 300 300 0 0 1 97.86796564403576 522.1320343559643  L 168.57864376269052 451.4213562373095 A 200 200 0 0 0 310 510  z" fill="rgba(255,255,255,0.3)"/>
        <image xlink:href="https://vignette.wikia.nocookie.net/gtawiki/images/b/b4/SawedoffShotgun-GTAVPC-HUD.png/revision/latest/scale-to-width-down/185?cb=20150419121516" x="-50" y="510" height="120px" width="120px"/>
        <text x="-90" y="620" font-size="18" fill="white">Sawed-Off Shotgun</text>
      </g>
      
      <g onclick="changeCurrentWeaponWith(this)" 
        onmouseover="mouseoverWeapon(this)" 
        onmouseout="onmouseoutWeapon()" 
        data-weapon="Cantidad: -" 
        data-image="https://vignette.wikia.nocookie.net/gtawiki/images/2/27/Minigun-GTAVPC-HUD.png/revision/latest/scale-to-width-down/185?cb=20150419122509" 
        data-damage="90%" 
        data-fire-rate="80%" 
        data-accuracy="40%" 
        data-range="30%">
        <path d="M 97.86796564403576 522.1320343559643 A 300 300 0 0 1 10 310.00000000000006  L 110 310 A 200 200 0 0 0 168.57864376269052 451.4213562373095  z" fill="rgba(255,255,255,0.3)"/>
        <image xlink:href="https://vignette.wikia.nocookie.net/gtawiki/images/2/27/Minigun-GTAVPC-HUD.png/revision/latest/scale-to-width-down/185?cb=20150419122509" x="-150" y="330" height="150px" width="150px"/>
        <text x="-100" y="460" font-size="18" fill="white">Minigun</text>
      </g>
      
      <g onclick="changeCurrentWeaponWith(this)"
        onmouseover="mouseoverWeapon(this)" 
        onmouseout="onmouseoutWeapon()" 
        data-weapon="Cantidad: -" 
        data-image="https://www.vespura.com/fivem/weapons/images/WEAPON_ASSAULTRIFLE.png" 
        data-damage="30%" 
        data-fire-rate="60%" 
        data-accuracy="45%" 
        data-range="45%">
        <path d="M 10 310.00000000000006 A 300 300 0 0 1 97.8679656440357 97.86796564403576  L 168.57864376269046 168.57864376269052 A 200 200 0 0 0 110 310  z" fill="rgba(255,255,255,0.3)"/>
        <image xlink:href="https://www.vespura.com/fivem/weapons/images/WEAPON_ASSAULTRIFLE.png" x="-81" y="180" height="70px" width="160px"/>
        <text x="-80" y="280" font-size="18" fill="white">Assault Rifle</text>
      </g>
      
      <g onclick="changeCurrentWeaponWith(this)" 
        onmouseover="mouseoverWeapon(this)" 
        onmouseout="onmouseoutWeapon()" 
        
        data-weapon=
		<tr bgcolor=blue>
        	<th>Cantidad</th>
        </tr>
        <% 
			DataStockarma ds = new DataStockarma();
			LinkedList<Stockarma> listaS = ds.getAll();
			for(Stockarma s :  listaS) {
		%>
			<th> <%=s.getCantidad() %> </th>
		<%
			}
		%>
		
        data-image="https://vignette.wikia.nocookie.net/gtawiki/images/8/8f/Pistol-GTAVPC-HUD.png/revision/latest?cb=20150419121059" 
        data-damage="30%" 
        data-fire-rate="60%" 
        data-accuracy="80%" 
        data-range="60%">
        <path d="M 97.8679656440357 97.86796564403576 A 300 300 0 0 1 309.99999999999994 10  L 309.99999999999994 110 A 200 200 0 0 0 168.57864376269046 168.57864376269052  z" fill="rgba(255,255,255,0.3)"/>
        <image xlink:href="https://vignette.wikia.nocookie.net/gtawiki/images/8/8f/Pistol-GTAVPC-HUD.png/revision/latest?cb=20150419121059" x="130" y="90" height="100px" width="90px"/>
        <text x="150" y="190" font-size="18" fill="white">ApPistol</text>
      </g>
      
      <g onclick="changeCurrentWeaponWith(this)" 
        onmouseover="mouseoverWeapon(this)" 
        onmouseout="onmouseoutWeapon()" 
        data-weapon="Cantidad: -" 
        data-image="https://vignette.wikia.nocookie.net/gtawiki/images/5/5e/SMG-GTAVPC-HUD.png/revision/latest/scale-to-width-down/185?cb=20150419121752" 
        data-damage="70%" 
        data-fire-rate="10%" 
        data-accuracy="50%" 
        data-range="80%"
        class="active-weapon">
        <path d="M 309.99999999999994 10 A 300 300 0 0 1 522.1320343559642 97.8679656440357  L 451.4213562373095 168.57864376269046 A 200 200 0 0 0 309.99999999999994 110  z" fill="rgba(255,255,255,0.3)"/>
        <image xlink:href="https://vignette.wikia.nocookie.net/gtawiki/images/5/5e/SMG-GTAVPC-HUD.png/revision/latest/scale-to-width-down/185?cb=20150419121752" x="280" y="170" height="130px" width="130px"/>
        <text x="350" y="280" font-size="18" fill="white">SMG</text>
      </g>

      <g onclick="changeCurrentWeaponWith(this)" 
        onmouseover="mouseoverWeapon(this)" 
        onmouseout="onmouseoutWeapon()" 
        data-weapon="Cantidad: -" 
        data-image="https://vignette.wikia.nocookie.net/gtawiki/images/7/7a/CarbineRifle-GTAVPC-HUD.png/revision/latest/scale-to-width-down/185?cb=20150419121949"
        data-damage="90%" 
        data-fire-rate="20%" 
        data-accuracy="60%" 
        data-range="70%">
        <path d="M 522.1320343559642 97.8679656440357 A 300 300 0 0 1 610 309.99999999999994  L 510 309.99999999999994 A 200 200 0 0 0 451.4213562373095 168.57864376269046  z" fill="rgba(255,255,255,0.3)"/>
        <image xlink:href="https://vignette.wikia.nocookie.net/gtawiki/images/7/7a/CarbineRifle-GTAVPC-HUD.png/revision/latest/scale-to-width-down/185?cb=20150419121949" x="360" y="340" height="130px" width="130px"/>
        <text x="350" y="460" font-size="18" fill="white">Carbine Rifle</text>
      </g>
    </svg>
  </div>
  <!-- partial -->
    <script src='https://cdnjs.cloudflare.com/ajax/libs/SoundJS/1.0.2/soundjs.min.js'></script><script  src="../../dist/js/armasV.js"></script>  
</body>
</html>