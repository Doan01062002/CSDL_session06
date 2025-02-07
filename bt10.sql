use session06;

-- 2,
DELETE FROM Appointments 
WHERE AppointmentDate < CURDATE() 
AND DoctorID = (SELECT DoctorID FROM Doctors WHERE DoctorName = 'Phan Huong');

SELECT 
    a.AppointmentID, 
    p.PatientName, 
    d.DoctorName, 
    a.AppointmentDate, 
    a.Status
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID;

-- 3,
UPDATE Appointments 
SET Status = 'Dang chờ' 
WHERE AppointmentDate >= CURDATE() 
AND PatientID = (SELECT PatientID FROM Patients WHERE PatientName = 'Nguyen Van An')
AND DoctorID = (SELECT DoctorID FROM Doctors WHERE DoctorName = 'Phan Huong');

SELECT 
    a.AppointmentID, 
    p.PatientName, 
    d.DoctorName, 
    a.AppointmentDate, 
    a.Status
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID;

-- 4,
SELECT 
    p.PatientName, 
    d.DoctorName, 
    a.AppointmentDate, 
    a.Diagnosis
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
WHERE (p.PatientID, d.DoctorID) IN (
    SELECT PatientID, DoctorID 
    FROM Appointments 
    GROUP BY PatientID, DoctorID 
    HAVING COUNT(AppointmentID) >= 2
);

-- 5,
SELECT 
    UPPER(CONCAT('BỆNH NHÂN: ', p.PatientName, ' - BÁC SĨ: ', d.DoctorName)) AS Info, 
    a.AppointmentDate, 
    a.Diagnosis, 
    a.Status
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
ORDER BY a.AppointmentDate ASC;

-- 6,
SELECT 
    UPPER(CONCAT('BỆNH NHÂN: ', p.PatientName, ' - BÁC SĨ: ', d.DoctorName)) AS Info, 
    a.AppointmentDate, 
    YEAR(a.AppointmentDate) AS AppointmentYear,
    CASE 
        WHEN a.AppointmentDate >= CURDATE() THEN 'Tương lai' 
        ELSE 'Đã qua' 
    END AS AppointmentStatus
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
ORDER BY a.AppointmentDate ASC;
