package org.mlearning.dto.contenu;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.persistence.Column;
import javax.persistence.JoinColumn;

@Entity
public class Question implements java.io.Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String label;
	private int type;//	0: Reponse courte	|	1: Vrai faux	|	2: Question à choix unique	|	3: Question à choix multiple
	private String reponseCourte;//ça represente la réponse correcte si type=0
	private String option1;
	private float poids1;
	private float penalite1;
	private String option2;
	private float poids2;
	private float penalite2;
	private String option3;
	private float poids3;
	private float penalite3;
	private String option4;
	private float poids4;
	private float penalite4;
	private String option5;
	private float poids5;
	@ManyToMany(mappedBy="question")
	private List<Quizz> quizz;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getReponseCourte() {
		return reponseCourte;
	}
	public void setReponseCourte(String reponseCourte) {
		this.reponseCourte = reponseCourte;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public float getPoids1() {
		return poids1;
	}
	public void setPoids1(float poids1) {
		this.poids1 = poids1;
	}
	public float getPenalite1() {
		return penalite1;
	}
	public void setPenalite1(float penalite1) {
		this.penalite1 = penalite1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public float getPoids2() {
		return poids2;
	}
	public void setPoids2(float poids2) {
		this.poids2 = poids2;
	}
	public float getPenalite2() {
		return penalite2;
	}
	public void setPenalite2(float penalite2) {
		this.penalite2 = penalite2;
	}
	public String getOption3() {
		return option3;
	}
	public void setOption3(String option3) {
		this.option3 = option3;
	}
	public float getPoids3() {
		return poids3;
	}
	public void setPoids3(float poids3) {
		this.poids3 = poids3;
	}
	public float getPenalite3() {
		return penalite3;
	}
	public void setPenalite3(float penalite3) {
		this.penalite3 = penalite3;
	}
	public String getOption4() {
		return option4;
	}
	public void setOption4(String option4) {
		this.option4 = option4;
	}
	public float getPoids4() {
		return poids4;
	}
	public void setPoids4(float poids4) {
		this.poids4 = poids4;
	}
	public float getPenalite4() {
		return penalite4;
	}
	public void setPenalite4(float penalite4) {
		this.penalite4 = penalite4;
	}
	public String getOption5() {
		return option5;
	}
	public void setOption5(String option5) {
		this.option5 = option5;
	}
	public float getPoids5() {
		return poids5;
	}
	public void setPoids5(float poids5) {
		this.poids5 = poids5;
	}
	public float getPenalite5() {
		return penalite5;
	}
	public void setPenalite5(float penalite5) {
		this.penalite5 = penalite5;
	}
	public String getOption6() {
		return option6;
	}
	public void setOption6(String option6) {
		this.option6 = option6;
	}
	public float getPoids6() {
		return poids6;
	}
	public void setPoids6(float poids6) {
		this.poids6 = poids6;
	}
	public float getPenalite6() {
		return penalite6;
	}
	public void setPenalite6(float penalite6) {
		this.penalite6 = penalite6;
	}
	public String getOption7() {
		return option7;
	}
	public void setOption7(String option7) {
		this.option7 = option7;
	}
	public float getPoids7() {
		return poids7;
	}
	public void setPoids7(float poids7) {
		this.poids7 = poids7;
	}
	public float getPenalite7() {
		return penalite7;
	}
	public void setPenalite7(float penalite7) {
		this.penalite7 = penalite7;
	}
	public String getOption8() {
		return option8;
	}
	public void setOption8(String option8) {
		this.option8 = option8;
	}
	public float getPoids8() {
		return poids8;
	}
	public void setPoids8(float poids8) {
		this.poids8 = poids8;
	}
	public float getPenalite8() {
		return penalite8;
	}
	public void setPenalite8(float penalite8) {
		this.penalite8 = penalite8;
	}
	public String getOption9() {
		return option9;
	}
	public void setOption9(String option9) {
		this.option9 = option9;
	}
	public float getPoids9() {
		return poids9;
	}
	public void setPoids9(float poids9) {
		this.poids9 = poids9;
	}
	public float getPenalite9() {
		return penalite9;
	}
	public void setPenalite9(float penalite9) {
		this.penalite9 = penalite9;
	}
	public String getOption10() {
		return option10;
	}
	public void setOption10(String option10) {
		this.option10 = option10;
	}
	public float getPoids10() {
		return poids10;
	}
	public void setPoids10(float poids10) {
		this.poids10 = poids10;
	}
	public float getPenalite10() {
		return penalite10;
	}
	public void setPenalite10(float penalite10) {
		this.penalite10 = penalite10;
	}
	public List<Quizz> getQuizz() {
		return quizz;
	}
	public void setQuizz(List<Quizz> quizz) {
		this.quizz = quizz;
	}
	private float penalite5;
	private String option6;
	private float poids6;
	private float penalite6;
	private String option7;
	private float poids7;
	private float penalite7;
	private String option8;
	private float poids8;
	private float penalite8;
	private String option9;
	private float poids9;
	private float penalite9;
	private String option10;
	private float poids10;
	private float penalite10;



}
