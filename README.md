# Medi Tech Plus

![MediTech Logo](https://github.com/slovish/MediTech_Plus/assets/86742240/0a41ceef-6c10-42cd-a37d-c3af8d7b4d72)

A Flutter App for ML-Based Disease Prognosis and Specialized Doctor Recommendations

## Contributors- 
### Vishal Jha (S.P.I.T. B.Tech EXTC)
### Vyoum Khare (S.P.I.T. B.Tech EXTC)

## Introduction
MediTech Plus is a cutting-edge healthcare professional and institution recommendation system powered by machine learning (ML) and focused on disease diagnosis. With the ever-increasing complexity of medical conditions, accurate and efficient diagnosis plays a crucial role in patient care. MediTech leverages ML algorithms to analyze patient data, including symptoms, medical history, and test results, to provide precise disease diagnoses. Additionally, it recommends the most suitable healthcare professionals and institutions for personalized treatment plans. By incorporating advanced ML techniques, MediTech aims to enhance the accuracy of diagnoses, reduce the workload of medical professionals, improve patient outcomes, and optimize the overall healthcare experience.

## Project Objectives

1. Develop ML-based disease diagnosis system.
2. Create comprehensive healthcare professional and institution database.
3. Design user-friendly interfaces for patients and healthcare professionals.
4. Ensure data privacy and security compliance.
5. Evaluate and optimize system performance based on user feedback.
6. Ensure scalability and integration with existing healthcare systems and EHRs.

## Theory

The disease detection app is a comprehensive healthcare solution that combines symptom-based disease prediction with doctor and hospital integration. Its theoretical framework encompasses the following key elements:

1. Symptom-Based Disease Prediction: The app utilizes a robust symptom database comprising information about various diseases and their associated symptoms. By leveraging advanced algorithms, including machine learning and pattern recognition, the app analyzes user-input symptoms to identify potential diseases. This approach enables accurate disease prediction based on symptom patterns and associations.

2. Doctor Database and Ratings: To facilitate seamless healthcare access, the app integrates a comprehensive doctor database. This database includes essential details such as doctor profiles, specializations, contact information, and patient ratings. Leveraging location-based services, the app allows users to easily find and connect with relevant healthcare providers in their vicinity.

3. Doctor Ratings and Availability: In addition to basic doctor information, the app presents user-generated ratings and reviews. These ratings are based on factors like the doctor's expertise, communication skills, and patient satisfaction. Users can assess these ratings to make informed decisions when selecting a doctor. The app also provides information on doctor availability, allowing users to check schedules and book appointments conveniently.

4. Hospital Ratings: The app incorporates a rating system for nearby hospitals, providing users with insights into the quality of care, facilities, and patient experiences. Ratings and reviews enable users to evaluate hospitals and make informed choices regarding their healthcare institution preference.

By combining symptom-based disease prediction, doctor integration with ratings and availability, and hospital ratings, the app aims to offer a comprehensive healthcare experience. Users can receive preliminary disease predictions based on symptoms, connect with suitable doctors in their area, and evaluate hospitals for their healthcare needs. However, it is crucial to note that the app should not replace professional medical advice, and users are encouraged to consult healthcare professionals for accurate diagnoses and personalized treatment recommendations.

## Model Implemented

A Random Forest model was implemented to analyze the dataset available at http://people.dbmi.columbia.edu/~friedma/Projects/DiseaseSymptomKB/index.html, which contains a collection of disease symptoms and associated diseases. The dataset consists of **43** unique diseases and **57** distinct symptoms. 

The Random Forest algorithm was chosen due to its ability to handle large datasets and handle both categorical and numerical features effectively (in this case one hot encoded dataset). The model was trained using a subset of the dataset. 

During training, the Random Forest algorithm created an ensemble of decision trees and utilized a random subset of features at each split. This helped to minimize overfitting and improve the model's generalization capability. 

<p align="center">
<img src = "https://github.com/slovish/MediTech_Plus/assets/86742240/0818275a-6ecc-4f5f-801a-4020b1f79961" width = "" height = "250">
    
                                                    Decision Tree Ensemble made by model
</p>
                                                          
After training, the model achieved an impressive accuracy of **91%** on the test dataset, demonstrating its ability to accurately predict diseases based on the given symptoms. Additionally, feature importance analysis revealed the most significant symptoms contributing to the disease predictions. 

Overall, the implemented Random Forest model on the disease symptom dataset provided valuable insights into the relationship between symptoms and diseases, offering potential benefits in disease diagnosis and healthcare decision-making.

## Screen Shots
| | |
| ------------- | ------------- |
| ![registration_screen](https://github.com/slovish/MediTech_Plus/assets/86742240/249116a9-370e-4aa0-877a-856832c90cf7) | ![homescreen](https://github.com/slovish/MediTech_Plus/assets/86742240/1ad0b5f9-db29-42fc-9f1d-b040996efb9e) |
| ![doctors_list](https://github.com/slovish/MediTech_Plus/assets/86742240/3c5a81c8-a669-477a-bdf3-cbd8f40718f8) | ![dr_profile](https://github.com/slovish/MediTech_Plus/assets/86742240/a0d3cc6f-49ac-4ce1-a07b-b884532dee3c) |
|![image](https://github.com/slovish/MediTech_Plus/assets/86742240/69edc1de-97ed-44d0-9354-d8e6e74ff043) | ![user_profile](https://github.com/slovish/MediTech_Plus/assets/86742240/289b7925-e6e6-4dc9-8314-06e1d2251032) |




## System Design 

### Flutter

<p align="center">
    
<img src = "https://github.com/slovish/MediTech_Plus/assets/86742240/a87eef5f-573f-4923-8a6f-2006d2b5e2b6" width = "562" height = "267">
    
</p>

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Firebase
<p align="center">

<img src = "https://github.com/slovish/MediTech_Plus/assets/86742240/4335e65b-de83-4e3d-be09-7e8609ecec44">

</p>

### sci-kit learn
<p align="center">

<img src = "https://github.com/slovish/MediTech_Plus/assets/86742240/4eec5ce7-77de-445c-9d31-c4abbc0bb4b0">

</p>

### Pandas
<p align="center">

<img src = "https://github.com/slovish/MediTech_Plus/assets/86742240/9d7cf7b8-575b-4dbf-ac93-c99a0bdaa8e5">

</p>







