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
public class Quizz extends Ressource implements java.io.Serializable{
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(	name="quizz_question",
				joinColumns = {@JoinColumn(name="quizz_id")},
				inverseJoinColumns = { @JoinColumn(name = "question_id") })
	private List<Question> question;

	public List<Question> getQuestion() {
		return question;
	}

	public void setQuestion(List<Question> question) {
		this.question = question;
	}

}
