import joblib
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
import numpy as np

def train_drug_interaction_model(X, y):
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    
    model = RandomForestClassifier(n_estimators=100, random_state=42)
    model.fit(X_train, y_train)
    
    y_pred = model.predict(X_test)
    accuracy = accuracy_score(y_test, y_pred)
    print(f"Model accuracy: {accuracy}")
    
    joblib.dump(model, 'drug_interaction_model.joblib')
    return model

def predict_drug_interaction(model, drug1, drug2):
    # This is a placeholder. In a real scenario, you'd need to preprocess the drug data
    # to match the format used during training.
    input_data = np.array([[drug1, drug2]])
    prediction = model.predict(input_data)
    return prediction[0]