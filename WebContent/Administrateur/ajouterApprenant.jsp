<%@page import="org.mlearning.dto.contenu.Formation"%>
<%@page import="org.mlearning.dto.users.User"%>
<%@page import="java.util.List"%>

<jsp:include page="../assets/layout/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="css/administrateur.css" />
	<div class="mainwrapper">
		<jsp:include page="../assets/layout/administrateur/menu.jsp"></jsp:include>
		<div class="rightpanel">
    		<jsp:include page="../assets/layout/common/top.jsp"></jsp:include>
    		
    		<!-- BREAD CRUMB -START  -->
			<div class="breadcrumbwidget">
				<ul class="breadcrumb">
					<li><a href="./">Accueil</a> <span class="divider">/</span></li>
					<li class="active">Tableau de bord</li>
				</ul>
			</div>
			<!-- BREAD CRUMB -END  -->
			
			<div class="pagetitle">
				<h1>NOUVEAU APPRENANT</h1> <span>Administration de la plateforme...</span>
			</div>

				<div class="maincontent">
					<h2 align="center" class="d_title">Ajouter apprenant</h2><hr/>
					<form action="AjouterApprenantServlet" method="POST" class="stdform" id="ajouterApprenantForm" novalidate="novalidate" enctype="multipart/form-data">
						<div class="par control-group">
							<label for="nom" class="control-label">Nom</label>
							<div class="controls"><input type="text" class="input-xxlarge" id="nom" name="nom"></div>
						</div>
						<div class="par control-group">
							<label for="prenom" class="control-label">Prénom</label>
							<div class="controls"><input type="text" class="input-xxlarge" id="prenom" name="prenom"></div>
						</div>
						<div class="par control-group">
							<label for="login" class="control-label">Login</label>
							<div class="controls"><input type="text" class="input-xxlarge" id="login" name="login"></div>
						</div>
						<div class="par control-group">
							<label for="password" class="control-label">Mot de passe</label>
							<div class="controls"><input type="password" class="input-xxlarge" id="password" name="password"></div>
						</div>
						<div class="par control-group">
							<label for="identifiant" class="control-label">Identifiant unique</label>
							<div class="controls"><input type="text" class="input-xxlarge" id="identifiant" name="identifiant"></div>
						</div>
						<div class="par control-group">
							<label for="client" class="control-label">Nature identifiant</label>
							<div class="controls">
								<select class="uniformselect input-xxlarge" id="natureidentifiant" name="natureidentifiant" style="opacity: 0;">
									<option value="">Sélectionner la nature de l'identifiant</option>
									<option value="0">Carte nationale</option>
									<option value="1">Passeport</option>
									<option value="2">Carte de séjour</option>
								</select>
							</div>
						</div>
						<div class="par control-group">
							<label for="email" class="control-label">Email</label>
							<div class="controls"><input type="text" class="input-xxlarge" id="email" name="email"></div>
						</div>
						<div class="par control-group">
							<label for="naissance" class="control-label">Date de naissance</label>
							<input id="datenaissance" type="text" name="naissance" class="input-xxlarge" />
						</div>
						<div class="par control-group">
							<label for="phone" class="control-label">Téléphone</label>
							<div class="controls"><input type="text" class="input-xxlarge" id="phone" name="phone"></div>
						</div>
						<div class="par control-group">
							<label for="pays" class="control-label">Pays</label>
							<div class="controls">
								<select class="uniformselect input-xxlarge" id="pays" name="pays" style="opacity: 0;"><option value="Afghanistan">Afghanistan </option><option value="Afrique_Centrale">Afrique_Centrale </option><option value="Afrique_du_sud">Afrique_du_Sud </option> <option value="Albanie">Albanie </option><option value="Algerie">Algerie </option><option value="Allemagne">Allemagne </option><option value="Andorre">Andorre </option><option value="Angola">Angola </option><option value="Anguilla">Anguilla </option><option value="Arabie_Saoudite">Arabie_Saoudite </option><option value="Argentine">Argentine </option><option value="Armenie">Armenie </option> <option value="Australie">Australie </option><option value="Autriche">Autriche </option><option value="Azerbaidjan">Azerbaidjan </option><option value="Bahamas">Bahamas </option><option value="Bangladesh">Bangladesh </option><option value="Barbade">Barbade </option><option value="Bahrein">Bahrein </option><option value="Belgique">Belgique </option><option value="Belize">Belize </option><option value="Benin">Benin </option><option value="Bermudes">Bermudes </option><option value="Bielorussie">Bielorussie </option><option value="Bolivie">Bolivie </option><option value="Botswana">Botswana </option><option value="Bhoutan">Bhoutan </option><option value="Boznie_Herzegovine">Boznie_Herzegovine </option><option value="Bresil">Bresil </option><option value="Brunei">Brunei </option><option value="Bulgarie">Bulgarie </option><option value="Burkina_Faso">Burkina_Faso </option><option value="Burundi">Burundi </option><option value="Caiman">Caiman </option><option value="Cambodge">Cambodge </option><option value="Cameroun">Cameroun </option><option value="Canada">Canada </option><option value="Canaries">Canaries </option><option value="Cap_vert">Cap_Vert </option><option value="Chili">Chili </option><option value="Chine">Chine </option> <option value="Chypre">Chypre </option> <option value="Colombie">Colombie </option><option value="Comores">Colombie </option><option value="Congo">Congo </option><option value="Congo_democratique">Congo_democratique </option><option value="Cook">Cook </option><option value="Coree_du_Nord">Coree_du_Nord </option><option value="Coree_du_Sud">Coree_du_Sud </option><option value="Costa_Rica">Costa_Rica </option><option value="Cote_d_Ivoire">Côte_d_Ivoire </option><option value="Croatie">Croatie </option><option value="Cuba">Cuba </option><option value="Danemark">Danemark </option><option value="Djibouti">Djibouti </option><option value="Dominique">Dominique </option><option value="Egypte">Egypte </option> <option value="Emirats_Arabes_Unis">Emirats_Arabes_Unis </option><option value="Equateur">Equateur </option><option value="Erythree">Erythree </option><option value="Espagne">Espagne </option><option value="Estonie">Estonie </option><option value="Etats_Unis">Etats_Unis </option><option value="Ethiopie">Ethiopie </option><option value="Falkland">Falkland </option><option value="Feroe">Feroe </option><option value="Fidji">Fidji </option><option value="Finlande">Finlande </option><option value="France">France </option><option value="Gabon">Gabon </option><option value="Gambie">Gambie </option><option value="Georgie">Georgie </option><option value="Ghana">Ghana </option><option value="Gibraltar">Gibraltar </option><option value="Grece">Grece </option><option value="Grenade">Grenade </option><option value="Groenland">Groenland </option><option value="Guadeloupe">Guadeloupe </option><option value="Guam">Guam </option><option value="Guatemala">Guatemala</option><option value="Guernesey">Guernesey </option><option value="Guinee">Guinee </option><option value="Guinee_Bissau">Guinee_Bissau </option><option value="Guinee equatoriale">Guinee_Equatoriale </option><option value="Guyana">Guyana </option><option value="Guyane_Francaise ">Guyane_Francaise </option><option value="Haiti">Haiti </option><option value="Hawaii">Hawaii </option> <option value="Honduras">Honduras </option><option value="Hong_Kong">Hong_Kong </option><option value="Hongrie">Hongrie </option><option value="Inde">Inde </option><option value="Indonesie">Indonesie </option><option value="Iran">Iran </option><option value="Iraq">Iraq </option><option value="Irlande">Irlande </option><option value="Islande">Islande </option><option value="Israel">Israel </option><option value="Italie">italie </option><option value="Jamaique">Jamaique </option><option value="Jan Mayen">Jan Mayen </option><option value="Japon">Japon </option><option value="Jersey">Jersey </option><option value="Jordanie">Jordanie </option><option value="Kazakhstan">Kazakhstan </option><option value="Kenya">Kenya </option><option value="Kirghizstan">Kirghizistan </option><option value="Kiribati">Kiribati </option><option value="Koweit">Koweit </option><option value="Laos">Laos </option><option value="Lesotho">Lesotho </option><option value="Lettonie">Lettonie </option><option value="Liban">Liban </option><option value="Liberia">Liberia </option><option value="Liechtenstein">Liechtenstein </option><option value="Lituanie">Lituanie </option> <option value="Luxembourg">Luxembourg </option><option value="Lybie">Lybie </option><option value="Macao">Macao </option><option value="Macedoine">Macedoine </option><option value="Madagascar">Madagascar </option><option value="Madère">Madère </option><option value="Malaisie">Malaisie </option><option value="Malawi">Malawi </option><option value="Maldives">Maldives </option><option value="Mali">Mali </option><option value="Malte">Malte </option><option value="Man">Man </option><option value="Mariannes du Nord">Mariannes du Nord </option><option value="Maroc">Maroc </option><option value="Marshall">Marshall </option><option value="Martinique">Martinique </option><option value="Maurice">Maurice </option><option value="Mauritanie">Mauritanie </option><option value="Mayotte">Mayotte </option><option value="Mexique">Mexique </option><option value="Micronesie">Micronesie </option><option value="Midway">Midway </option><option value="Moldavie">Moldavie </option><option value="Monaco">Monaco </option><option value="Mongolie">Mongolie </option><option value="Montserrat">Montserrat </option><option value="Mozambique">Mozambique </option><option value="Namibie">Namibie </option><option value="Nauru">Nauru </option><option value="Nepal">Nepal </option><option value="Nicaragua">Nicaragua </option><option value="Niger">Niger </option><option value="Nigeria">Nigeria </option><option value="Niue">Niue </option><option value="Norfolk">Norfolk </option><option value="Norvege">Norvege </option><option value="Nouvelle_Caledonie">Nouvelle_Caledonie </option><option value="Nouvelle_Zelande">Nouvelle_Zelande </option><option value="Oman">Oman </option><option value="Ouganda">Ouganda </option><option value="Ouzbekistan">Ouzbekistan </option><option value="Pakistan">Pakistan </option><option value="Palau">Palau </option><option value="Palestine">Palestine </option><option value="Panama">Panama </option><option value="Papouasie_Nouvelle_Guinee">Papouasie_Nouvelle_Guinee </option><option value="Paraguay">Paraguay </option><option value="Pays_Bas">Pays_Bas </option><option value="Perou">Perou </option><option value="Philippines">Philippines </option> <option value="Pologne">Pologne </option><option value="Polynesie">Polynesie </option><option value="Porto_Rico">Porto_Rico </option><option value="Portugal">Portugal </option><option value="Qatar">Qatar </option><option value="Republique_Dominicaine">Republique_Dominicaine </option><option value="Republique_Tcheque">Republique_Tcheque </option><option value="Reunion">Reunion </option><option value="Roumanie">Roumanie </option><option value="Royaume_Uni">Royaume_Uni </option><option value="Russie">Russie </option><option value="Rwanda">Rwanda </option><option value="Sahara Occidental">Sahara Occidental </option><option value="Sainte_Lucie">Sainte_Lucie </option><option value="Saint_Marin">Saint_Marin </option><option value="Salomon">Salomon </option><option value="Salvador">Salvador </option><option value="Samoa_Occidentales">Samoa_Occidentales</option><option value="Samoa_Americaine">Samoa_Americaine </option><option value="Sao_Tome_et_Principe">Sao_Tome_et_Principe </option> <option value="Senegal">Senegal </option> <option value="Seychelles">Seychelles </option><option value="Sierra Leone">Sierra Leone </option><option value="Singapour">Singapour </option><option value="Slovaquie">Slovaquie </option><option value="Slovenie">Slovenie</option><option value="Somalie">Somalie </option><option value="Soudan">Soudan </option> <option value="Sri_Lanka">Sri_Lanka </option> <option value="Suede">Suede </option><option value="Suisse" selected="selected">Suisse </option><option value="Surinam">Surinam </option><option value="Swaziland">Swaziland </option><option value="Syrie">Syrie </option><option value="Tadjikistan">Tadjikistan </option><option value="Taiwan">Taiwan </option><option value="Tonga">Tonga </option><option value="Tanzanie">Tanzanie </option><option value="Tchad">Tchad </option><option value="Thailande">Thailande </option><option value="Tibet">Tibet </option><option value="Timor_Oriental">Timor_Oriental </option><option value="Togo">Togo </option> <option value="Trinite_et_Tobago">Trinite_et_Tobago </option><option value="Tristan da cunha">Tristan de cuncha </option><option value="Tunisie">Tunisie </option><option value="Turkmenistan">Turmenistan </option> <option value="Turquie">Turquie </option><option value="Ukraine">Ukraine </option><option value="Uruguay">Uruguay </option><option value="Vanuatu">Vanuatu </option><option value="Vatican">Vatican </option><option value="Venezuela">Venezuela </option><option value="Vierges_Americaines">Vierges_Americaines </option><option value="Vierges_Britanniques">Vierges_Britanniques </option><option value="Vietnam">Vietnam </option><option value="Wake">Wake </option><option value="Wallis et Futuma">Wallis et Futuma </option><option value="Yemen">Yemen </option><option value="Yougoslavie">Yougoslavie </option><option value="Zambie">Zambie </option><option value="Zimbabwe">Zimbabwe </option></select>
							</div>
						</div>
						<div class="par control-group">
							<label for="ville" class="control-label">Ville</label>
							<div class="controls"><input type="text" class="input-xxlarge" id="ville" name="ville"></div>
						</div>
						<div class="par control-group">
							<label for="adresse" class="control-label">Adresse</label>
							<div class="controls"><textarea id="adresse" class="input-xxlarge" name="adresse" rows="5" cols="80"></textarea></div> 
						</div>
						<div class="par">
							<label>Photo de l'apprenant</label>
							<div class="fileupload fileupload-new" data-provides="fileupload"><input type="hidden">
								<div class="input-append">
									<div class="uneditable-input span4">
										<i class="icon-file fileupload-exists"></i>
										<span class="fileupload-preview"></span>
									</div>
									<span class="btn btn-file"><span class="fileupload-new">Upload</span>
									<span class="fileupload-exists">Modifier</span>
									<input type="file" name="file" id="file"></span>
									<a href="#" class="btn fileupload-exists" data-dismiss="fileupload">Supprimer</a>
								</div>
							</div>
						</div>
						<p class="stdformbutton">
							<button class="btn btn-primary btn-rounded">Ajouter apprenant</button>
						</p>
					</form>
				</div>
			</div>	
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>