package medicine;

import java.util.List;
import java.util.ArrayList;

public class Patient {
    private String name;
    private List<Medication> medications;
    private int bpm;
    private String bloodPressure;

    public Patient(String name) {
        this.name = name;
        this.medications = new ArrayList<>();
        this.bpm = 75; // Default value
        this.bloodPressure = "120/80"; // Default value
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Medication> getMedications() {
		return medications;
	}

	public void setMedications(List<Medication> medications) {
		this.medications = medications;
	}

	public int getBpm() {
		return bpm;
	}

	public void setBpm(int bpm) {
		this.bpm = bpm;
	}

	public String getBloodPressure() {
		return bloodPressure;
	}

	public void setBloodPressure(String bloodPressure) {
		this.bloodPressure = bloodPressure;
	}

    
}