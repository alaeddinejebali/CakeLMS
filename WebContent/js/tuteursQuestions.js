jQuery(document).ready(function(){
	var nbrQuestion;
	var selectedQuestinType;
	var ResQuery;
	var tab;
	/***************************************************************************************/
	/**************************	INITIALISER TOUS	********************************/
	/***************************************************************************************/
	function init(){
		nbrQuestion = 0;
		selectedQuestinType = null;
		ResQuery = "";
		tab = [];
		jQuery("#nbrQuestions").text(nbrQuestion);
		jQuery("#questionsCrees").text('');
		jQuery(".choixQuestion").removeClass('activeQuestion');
	}
	
	/***************************************************************************************/
	/**************************	EFFACER TOUS LES QUESTIONS	********************************/
	/***************************************************************************************/
	jQuery("#btnEffacerTous").click(function(){
		init();
	});

	/***************************************************************************************/
	/*****************************	AJOUTER UNE QUESTION	********************************/
	/***************************************************************************************/
	jQuery("#btnAjouterQuestion").click(function(){
		var vType;
		var nbrOptions;
		if(selectedQuestinType==0){
			vType = "Réponse courte";

		}
		else if(selectedQuestinType==1){
			nbrOptions = prompt("Combien d'options contiendra cette question?");
			vType = "Choix unique (" + nbrOptions + " options)";
			tab.push(selectedQuestinType + "*" + nbrOptions);
		}	
		else if(selectedQuestinType==2){
			nbrOptions = prompt("Combien d'options contiendra cette question?");
			vType = "Choix multiple (" + nbrOptions + " options)";
			tab.push(selectedQuestinType + "*" + nbrOptions);
		}
		else if(selectedQuestinType==3){
			vType = "Vrai/Faux";
			tab.push(selectedQuestinType);
		}
		else{
			alert('Veuillez chosir le type du question');
			return false;
		}
		nbrQuestion++;
		jQuery("#nbrQuestions").text(nbrQuestion);
		var newContent = "<div id='" + (nbrQuestion-1) + "' class='row-fluid'><div class='span12'><div class='span2'></div><div class='span1'><img class='btnRemoveQuestion' src='images/remove.png' /></div><div class='span3'><h4>Question " + nbrQuestion + "</h4></div><div class='span4'><h4>" + vType + "</h4></div><div class='span2'></div></div></div>";
		jQuery("#questionsCrees").append( newContent);
		
	});

	/***************************************************************************************/
	/*****************************	SELECT QUESTION	********************************/
	/***************************************************************************************/
	jQuery(".choixQuestion").click(function(){
		selectedQuestinType = jQuery(this).attr("id");
		jQuery(".choixQuestion").removeClass('activeQuestion');
		jQuery(this).addClass('activeQuestion');
	});

	/***************************************************************************************/
	/**************************	VALIDER CREATION DES QUESTIONS	****************************/
	/***************************************************************************************/
	jQuery("#btnValiderCreationQuestions").click(function(){
		ResQuery = tab.join();
		jQuery("#questions").val(ResQuery);
	});

	/***************************************************************************************/
	/**************************	VALIDER CREATION DES QUESTIONS	****************************/
	/***************************************************************************************/
	jQuery(".btnRemoveQuestion").live("click",function(){
		var idRow = jQuery(this).parent().parent().parent().index();
		tab.splice(idRow, 1);
		jQuery(this).parent().parent().parent().remove();
	});

	/***************************************************************************************/
	/*****************************		********************************/
	/***************************************************************************************/	
	init();
});

