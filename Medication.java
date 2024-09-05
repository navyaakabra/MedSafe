package medicine;
import java.time.LocalTime;

public class Medication {
    private String name;
    private LocalTime scheduleTime;
    private boolean taken;

    // Constructor, getters, and setters
    public Medication(String name, LocalTime scheduleTime) {
        this.name = name;
        this.scheduleTime = scheduleTime;
        this.taken = false;
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public LocalTime getScheduleTime() {
		return scheduleTime;
	}

	public void setScheduleTime(LocalTime scheduleTime) {
		this.scheduleTime = scheduleTime;
	}

	public boolean isTaken() {
		return taken;
	}

	public void setTaken(boolean taken) {
		this.taken = taken;
	}

   
}