<?php
return [
    'appointment' => [
        'my-upcoming-appointments' => [],
        'my-past-appointments' => [],
        'appointment-detail?id=' => [],
        'patient-list?name=&page=' => [],
        'reschedule-appointment?id='  => [
            'Appointment[availability_time_id]' => '22'
        ],
        'doctor-book-appointment' => [
            'Appointment[patient_id]' => '1',
            'Appointment[availability_time_id]' => '22',
            'Appointment[availability_id]' => '1',
            'Appointment[doctor_notes]' => 'Test notes'
        ]
    ]
];
?>
