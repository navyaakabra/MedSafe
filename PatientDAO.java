package medicine;

import medicine.Patient;
import medicine.Medication;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.Map;

@SuppressWarnings("unused")
public class PatientDAO {
    private static final Map<String, Patient> patients = new HashMap<>();

    static {
        // Initialize with dummy data
        Patient patient = new Patient("John Doe");
        patient.getMedications().add(new Medication("Medication 1", LocalTime.of(9, 0)));
        patient.getMedications().add(new Medication("Medication 2", LocalTime.of(14, 0)));
        patient.getMedications().add(new Medication("Medication 3", LocalTime.of(20, 0)));
        patients.put("johndoe", patient);
    }

    // Create operation
    public static void createPatient(String username, Patient patient) {
        patients.put(username, patient);
    }

    // Read operation
    public static Patient getPatient(String username) {
        return patients.get(username);
    }

    // Update operation
    public static void updatePatient(String username, Patient updatedPatient) {
        if (patients.containsKey(username)) {
            patients.put(username, updatedPatient);
        }
    }

    // Delete operation
    public static void deletePatient(String username) {
        patients.remove(username);
    }

    // List all patients
    public static Map<String, Patient> getAllPatients() {
        return new HashMap<>(patients);
    }
}
