
     <?php
    return [
        'user' => [
            'doctor-signup' => [
                'User[first_name]' => 'test',
                'User[last_name]' => 'doctor',
                'User[contact_no]' => '2344',
                'User[email]' => 'Trand' . rand(0, 499) . 'est@' . rand(0, 499) . 'String.com',
                'User[password]' => 'admin@123',
                'User[country]' => 'Nigeria',
                'User[address]' => 'Test Adresss',
                'User[profile_file]' => '',
                'User[date_of_birth]' => '1993-03-03',
                'Workprofile[professional_status]' => '1',
                'Workprofile[professional_indemnity]' => '0',
                'Workprofile[MDCN_folio_number]' => '456',
                'Workprofile[MDCN_certificate]' => '1',
                'Workprofile[registeration_number]' => '11447799',
                'Workprofile[issued_date]' => '2020-01-22',
                'Workprofile[expiry_date]' => '2020-01-22',
                'Workprofile[profile_summary]' => 'test profile summary',
                'Doctorspecialization[categories]' => '2,6,7',
                'User[current_place_of_work]' => 'place of work',
                'DoctorLanguage[language_id]' => '5,6'
            ],
            'patient-signup' => [
                'User[first_name]' => 'test',
                'User[last_name]' => 'patient',
                'User[contact_no]' => '2344',
                'User[email]' => 'Trand' . rand(0, 499) . 'est@' . rand(0, 499) . 'String.com',
                'User[password]' => 'admin@123',
                'User[country]' => 'Nigeria',
                'User[address]' => 'Test Adresss',
                'User[profile_file]' => '',
                'User[date_of_birth]' => '',
                'PatientMedicalInformation[blood_group]' => '4',
                'PatientMedicalInformation[weight]' => '',
                'PatientMedicalInformation[height]' => '',
                'PatientMedicalInformation[allergies]' => '',
                'PatientSymptom[categories]' => '1,2,3'
            ],
            'login' => [
                'LoginForm[username]' => 'patient@toxsl.in',
                'LoginForm[password]' => 'admin@123',
                'LoginForm[device_token]' => '464346',
                'LoginForm[device_type]' => '1',
                'LoginForm[device_name]' => '1',
                'LoginForm[role_id]' => '4'
            ],
            'doctor-list' => [],

            'get-appointment?id=' => [],
            'doctor-appointments' => [],
            'get-time-slot' => [],
//             'book-appointment?patient_type=1' => [
//                 'Appointment[name]' => '',
//                 'Appointment[doctor_id]' => '1',
//                 'Appointment[health_issue]' => 'nothing',
//                 'Appointment[age]' => '22',
//                 'Appointment[gender]' => '0',
//                 'Appointment[date]' => '2018-12-23',
//                 'Appointment[time]' => '10:29am',
//                 'AppointmentIllness[illness_ids]' => '1,2'
//             ],
            'add-doctor-availability' => [
                'DoctorAvailability[date]' => '2018-12-20',
                'DoctorAvailability[repeat]' => '3',
                'AvailabilityTime[date]' => '2020-12-20',
                'AvailabilityTime[time]' => '12:00:00',
                'AvailabilityTime[price]' => '250',
                'AvailabilityTime[description]' => 'available'
            ],
            'doctor-appointments' => [],

            'recover' => [
                'User[email]' => ''
            ],
            'check' => [
                'DeviceDetail[device_token]' => 'patient@toxsl.in',
                'DeviceDetail[device_type]' => 'admin@123',
                'DeviceDetail[device_name]' => '12131313'
            ],
            'my-profile' => [],
            'change-password' => [
                'User[newPassword]' => 'admin@123',
                'User[confirm_password]' => 'admin@123'
            ],
            'add-money-to-wallet' => [
                'UserWallet[amount]' => '1000',
                'Transaction[transaction_id]' => 'ChargedFromAndroid_1581336248008'
            ],
            'add-document' => [
                'File[filename_path]' => ''
            ],
            'list-document' => [],
            'logout' => [],
            'category-list' => [],
            'get-category?$id=' => [],
            'medical-conditions' => [],
            'time-option-list' => [],
            'department-list' => [],
            'about' => [],
            'department-list' => [],
            'professional-status-list' => [],
            'remove-certificate' => [
                'Workprofile[file_type]' => '2'
            ],
            'favorite?doctor_id=' => [],
            'add-doctor-rating?doctor_id=' => [
                'Rating[rating]' => '4',
                'Rating[title]' => 'Test Rating',
                'Rating[comment]' => 'Test comment'
            ],
            'doctor-search?id=6&page=null&access-token=' => [],
            'doctor-consultation-availability?id=&access-token='  => [],
            'language-list?page=null' => [],
            'doctor-consultation-mode?page=null&access-token=' => [],
            'saving-doctor-availability' => [
                'DoctorConsultationAvailability[consultation_id]' => '1'
            ],
            'save-doctor-availability-dates' => [
                'DoctorAvailability[data]' => '{"data":[{"date":"2020-03-12","time_slots":["12:00:00 - 01:00:00","04:00:00 - 05:00:00"]},{"date":"2020-03-14","time_slots":["12:00:00 - 01:00:00","04:00:00 - 05:00:00"]}]}'
            ],
            'get-doctor-dates?id=' => [],
            'get-doctor-slots?id=&page=null' => [
                'AvailabilityTime[date]' => '2020-03-14'
            ],
            'book-appointment?' => [
                'Appointment[doctor_id]' => '1',
                'Appointment[availability_time_id]' => '22',
                'Appointment[availability_id]' => '1'
            ],
            'health-profile' => [
                'PatientMedicineHistory[medicineInfo]' => '[{"medicine_name":"med1","how_long":"3"},{"medicine_name":"med2","how_long":"4"}]',
                'PatientAllergies[allergies]' => 'test1,test2,test3',
                'PatientIllness[illness]'=>'[{"symptom_id":1,"key":[{"id":"1"},{"id":"2"}]},{"symptom_id":2,"key":[{"id":"3"},{"id":"4"}]}]'
            ],
            'doctor-pending-appointments?page=null' => [],
            'upcoming-appointment?page=null' => [],
            'past-appointment?page=null' => [], 
            'set-booking-status?id=&state=' => [],
            'my-favourite-doctor-list?page=null' => []
//             'add-to-favourite' =>[
//                 'Favorite[doctor_id]' => '12'
//             ]
        ]
    ];
    ?>
