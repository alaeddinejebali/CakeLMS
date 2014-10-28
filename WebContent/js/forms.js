jQuery(document).ready(function(){
	
	
	/**************************************************************************************************/
	/***************************		PREPARE DUAL SELECT OPTIONS		*******************************/
	/**************************************************************************************************/    
    jQuery(".formWithDualSelect").submit(function(e){
    	var Res = '';
    	jQuery('#dualselect select:last-child').find('option').each(function(){
			Res += jQuery(this).attr('value') + ',';
		});
    	jQuery("#hiddenDualSelect").val(Res);
    });
    
    
    
	// Transform upload file
	jQuery('.uniform-file').uniform();
	
	// Dual Box Select
	var db = jQuery('#dualselect').find('.ds_arrow button');	//get arrows of dual select
	var sel1 = jQuery('#dualselect select:first-child');		//get first select element
	var sel2 = jQuery('#dualselect select:last-child');			//get second select element
	
	sel2.empty(); //empty it first from dom.
	
	db.click(function(){
		var t = (jQuery(this).hasClass('ds_prev'))? 0 : 1;	// 0 if arrow prev otherwise arrow next
		if(t) {
			sel1.find('option').each(function(){
				if(jQuery(this).is(':selected')) {
					jQuery(this).attr('selected',false);
					var op = sel2.find('option:first-child');
					sel2.append(jQuery(this));
				}
			});	
		} else {
			sel2.find('option').each(function(){
				if(jQuery(this).is(':selected')) {
					jQuery(this).attr('selected',false);
					sel1.append(jQuery(this));
				}
			});		
		}
		return false;
	});	
	
	// Tags Input
	jQuery('#tags').tagsInput();

	// Spinner
	jQuery("#spinner").spinner({min: 0, max: 100, increment: 2});
	
	// Character Counter
	jQuery("#textarea2").charCount({
		allowed: 120,		
		warning: 20,
		counterText: 'Characters left: '	
	});
	
	// Select with Search
	jQuery(".chzn-select").chosen();
	
	// Textarea Autogrow
	jQuery('#autoResizeTA').autogrow();	
	
	
	// With Form Validation
	jQuery("#form1").validate({
		rules: {
			firstname: "required",
			lastname: "required",
			email: {
				required: true,
				email: true,
			},
			location: "required",
			selection: "required"
		},
		messages: {
			firstname: "Please enter your first name",
			lastname: "Please enter your last name",
			email: "Please enter a valid email address",
			location: "Please enter your location"
		},
		highlight: function(label) {
			jQuery(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		.text('Ok!').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	});
	
	jQuery('#timepicker1').timepicker();
	
	/**************************************************************************************************/
	/*******************		AJOUTER FORMATION FROM VALIDATION		*******************************/
	/**************************************************************************************************/
	jQuery("#ajouterFormationForm").validate({
		rules: {
			nom: "required",
			debut: "required",
			fin: "required",
			description: "required"
		},
		messages: {
			nom: "Le nom de la formation est obligatoire!",
			debut: "Veuillez choisir la date de d�but de la formation!",
			fin: "Veuillez choisir la date de fin de la formation!",
			description: "Veuillez ajouter une description!"
		},
		highlight: function(label) {
			jQuery(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		.text('').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	});	
    jQuery( "#dateDebutFormation" ).datepicker();
    jQuery( "#dateFinFormation" ).datepicker();

 
	/**************************************************************************************************/
	/*******************		AJOUTER CATEGORIE FROM VALIDATION		*******************************/
	/**************************************************************************************************/
	jQuery("#ajouterCategorieForm").validate({
		rules: {
			nom: "required",
			description: "required",
			excerpt: "required",
			parent: "required"
		},
		messages: {
			nom: "Le nom de la cat�gorie est obligatoire!",
			description: "Veuillez entrer une description du cat�gorie!",
			excerpt: "Veuillez entrer une excerpt pour la cat�gorie!",
			parent: "Veuillez choisir un parent!"
		},
		highlight: function(label) {
			jQuery(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		.text('').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	});

	 
	/**************************************************************************************************/
	/**************************		AJOUTER MODULE FROM VALIDATION		*******************************/
	/**************************************************************************************************/
	jQuery("#ajouterModuleForm").validate({
		rules: {
			nom: "required",
			description: "required",
			excerpt: "required"
		},
		messages: {
			nom: "Le nom du module est obligatoir!",
			description: "Veuillez entrer une description du module!",
			excerpt: "Veuillez entrer une excerpt pour le module!"
		},
		highlight: function(label) {
			jQuery(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		.text('').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	});

	 
	/**************************************************************************************************/
	/**************************		ASSIGNER CATEGORIES FROM VALIDATION		***************************/
	/**************************************************************************************************/
	jQuery("#affecterCategoriesForm").validate({
		rules: {
			formation: "required",
			categories: "required"
		},
		messages: {
			formation: "Veuillez choisir au moin une formation!",
			categories: "Veuillez choisir au moin une cat�gories!"
		},
		highlight: function(label) {
			jQuery(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		.text('').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	});

	 
	/**************************************************************************************************/
	/******************		ASSIGNER APPRENANTS-FORMATION FROM VALIDATION		***********************/
	/**************************************************************************************************/
	jQuery("#affecterApprenantsFormationsForm").validate({
		rules: {
			formation: "required",
			apprenants: "required"
		},
		messages: {
			formation: "Veuillez choisir au moin une formation!",
			apprenants: "Veuillez choisir au moin un apprenant!"
		},
		highlight: function(label) {
			jQuery(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		.text('').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	});
	

	 
	/**************************************************************************************************/
	/******************		ASSIGNER GROUPES-FORMATION FROM VALIDATION		***********************/
	/**************************************************************************************************/
	jQuery("#affecterGroupesFormationsForm").validate({
		rules: {
			formation: "required",
			groupes: "required"
		},
		messages: {
			formation: "Veuillez choisir au moin une formation!",
			groupes: "Veuillez choisir au moin un groupe!"
		},
		highlight: function(label) {
			jQuery(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		.text('').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	});


	/**************************************************************************************************/
	/**************************		ASSIGNER MODULES FROM VALIDATION		***************************/
	/**************************************************************************************************/
	jQuery("#affecterModulesForm").validate({
		rules: {
			modules: "required",
			categorie: "required"
		},
		messages: {
			modules: "Veuillez choisir au moin un module!",
			categorie: "Veuillez choisir une cat�gorie!"
		},
		highlight: function(label) {
			jQuery(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		.text('').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	});
	
	
	/**************************************************************************************************/
	/*******************		AJOUTER APPRENANT FROM VALIDATION		*******************************/
	/**************************************************************************************************/
	jQuery("#ajouterApprenantForm").validate({
		rules: {
			nom: "required",
			prenom: "required",
			login: "required",
			password: "required",
			identifiant: "required",
			natureidentifiant: "required",
			email: {
				required: true,
				email: true,
			},
			phone: "required",
			pays: "required",
			ville: "required",
			adresse: "required",
			naissance: "required",
			file: "required"
		},
		messages: {
			nom: "Le nom de l'apprenant est obligatoire!",
			prenom: "Le pr�nom de l'apprenant est obligatoire!",
			login: "Le login de l'apprenant est obligatoire!",
			password: "Le mot de passe de l'apprenant est obligatoire!",
			identifiant: "Le nom de l'apprenant est obligatoire!",
			natureidentifiant: "Veuillez choisir la nature de la l'identifiant!",
			email: "Email non valide!",
			phone: "Le num�ro mobile de l'apprenant est obligatoire!",
			pays: "Veuillez choisir le pays de l'apprenant!",
			ville: "La ville de l'apprenant est obligatoire!",
			adresse: "L'adresse de l'apprenant est obligatoire!",
			naissance: "Veuillez choisir la date de naissance de l'apprenant!",
			file: "La photo de l'apprenant est obligatoire"
		},
		highlight: function(label) {
			jQuery(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		.text('').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	});	
    jQuery( "#datenaissance" ).datepicker();
	
    
	/**************************************************************************************************/
	/************************		AJOUTER GROUPE FROM VALIDATION		*******************************/
	/**************************************************************************************************/
	jQuery("#ajouterGroupeForm").validate({
		rules: {
			nom: "required"
		},
		messages: {
			nom: "Le nom du groupe est obligatoire!"
		},
		highlight: function(label) {
			jQuery(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		.text('').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	});

	 
	/**************************************************************************************************/
	/**********************		ASSIGNER APPRENANTS-GROUPE FROM VALIDATION		***********************/
	/**************************************************************************************************/
	jQuery("#assignerApprenantsGroupeForm").validate({
		rules: {
			groupe: "required",
			apprenants: "required"
		},
		messages: {
			groupe: "Veuillez choisir un groupe!",
			apprenants: "Veuillez choisir au moin un apprenant!"
		},
		highlight: function(label) {
			jQuery(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		.text('').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	});

	 
	/**************************************************************************************************/
	/*************************		ASSIGNER TUTEUR-MODULE FROM VALIDATION		***********************/
	/**************************************************************************************************/
	jQuery("#affecterTuteursForm").validate({
		rules: {
			module: "required",
			tuteurs: "required"
		},
		messages: {
			module: "Veuillez choisir un module!",
			tuteurs: "Veuillez choisir au moin un tuteur!"
		},
		highlight: function(label) {
			jQuery(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		.text('').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	});

	 
	/**************************************************************************************************/
	/***********************		ENVOYER EMAIL FROM VALIDATION		*******************************/
	/**************************************************************************************************/
	jQuery("#envoyerMessageForm").validate({
		rules: {
			sujet: "required",
			message: "required"
		},
		messages: {
			sujet: "Veuillez remplir le sujet du message!",
			message: "Veuillez remplir le contenu du message!"
		},
		highlight: function(label) {
			jQuery(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		.text('').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	});


	 
	/**************************************************************************************************/
	/**********************		AJOUTER COURS-TEXTUEL FROM VALIDATION		***************************/
	/**************************************************************************************************/
	jQuery("#ajouterRessourceCoursTextForm").validate({
		rules: {
			titre: "required",
			description: "required",
			excerpt: "required",
			contenu: "required",
			tempsRequis: "required",
			file: "required"
		},
		messages: {
			titre: "Le titre du cours est obligatoire!",
			description: "Veuillez entrer une description du cours!",
			excerpt: "Veuillez entrer une excerpt pour le cours!",
			contenu: "Veuillez entrer un contenu pour le cours!",
			tempsRequis: "Le temps requis du cours est obligatoire!",
			file: "Le thumbnail du cours est obligatoire!"
		},
		highlight: function(label) {
			jQuery(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		.text('').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	});


	 
	/**************************************************************************************************/
	/************************		AJOUTER COURS-AUDIO FROM VALIDATION		***************************/
	/**************************************************************************************************/
	jQuery("#ajouterRessourceCoursAudioForm").validate({
		rules: {
			titre: "required",
			url: "required",
			description: "required",
			excerpt: "required",
			contenu: "required",
			tempsRequis: "required",
			file: "required"
		},
		messages: {
			titre: "Le titre du cours est obligatoire!",
			url: "Veuillez chosir un fichier audio pour ce cours!",
			description: "Veuillez entrer une description du cours!",
			excerpt: "Veuillez entrer une excerpt pour le cours!",
			contenu: "Veuillez entrer un contenu pour le cours!",
			tempsRequis: "Le temps requis du cours est obligatoire!",
			file: "Le thumbnail du cours est obligatoire!"
		},
		highlight: function(label) {
			jQuery(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		.text('').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	});


	 
	/**************************************************************************************************/
	/************************		AJOUTER COURS-VIDEO FROM VALIDATION		***************************/
	/**************************************************************************************************/
	jQuery("#ajouterRessourceCoursVideoForm").validate({
		rules: {
			titre: "required",
			url: "required",
			description: "required",
			excerpt: "required",
			contenu: "required",
			tempsRequis: "required",
			file: "required"
		},
		messages: {
			titre: "Le titre du cours est obligatoire!",
			url: "Veuillez chosir un fichier audio pour ce cours!",
			description: "Veuillez entrer une description du cours!",
			excerpt: "Veuillez entrer une excerpt pour le cours!",
			contenu: "Veuillez entrer un contenu pour le cours!",
			tempsRequis: "Le temps requis du cours est obligatoire!",
			file: "Le thumbnail du cours est obligatoire!"
		},
		highlight: function(label) {
			jQuery(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		.text('').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	});
	
	/**************************************************************************************************/
	/******************		AJOUTER SALLE DE FORMATION FROM VALIDATION		***************************/
	/**************************************************************************************************/
	jQuery("#ajouterSalleFormationForm").validate({
		rules: {
			nom: "required",
			description: "required",
			debut: "required",
			tempsDebut: "required",
			fin: "required",
			tempsFin: "required",
			apprenants: "required"
			
		},
		messages: {
			nom: "Le nom de la formation est obligatoire!",
			description: "Veuillez ajouter une description!",
			debut: "Veuillez choisir la date de debut de la formation!",
			tempsDebut: "Veuillez choisir le temps de debut de la formation!",
			fin: "Veuillez choisir la date de fin de la formation!",
			tempsFin: "Veuillez choisir le temps de fin de la formation!",
			apprenants: "Veuillez choisir au moin un apprenant"
		},
		highlight: function(label) {
			jQuery(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		.text('').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	});	
    jQuery( "#dateDebutFormation" ).datepicker();
    jQuery( "#dateFinFormation" ).datepicker();	
	
	/**************************************************************************************************/
	/*************************		/END DOCUMENTREADY FUNCTIONS		*******************************/
	/**************************************************************************************************/
});