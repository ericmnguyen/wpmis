-- Database: `ictp-mng-sys`

--
-- Table structure for table `login`
--
-- CREATE database `ictp-mng-sys`;
use `ictp-mng-sys`;
DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `RoleId` int(11) NOT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(300) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`UserId`),
  KEY `RoleId` (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `login` (`UserId`, `RoleId`, `Username`, `Password`, `CreatedDate`) VALUES
(1, 1, 'admin@example.com', 'e86f78a8a3caf0b60d8e74e5942aa6d86dc150cd3c03338aef25b7d2d7e3acc7', '2022-07-06 00:54:53'),
(2, 2, 'uc@example.com', 'ed86cd7f0d27d121b0c258bbadd1a1d7b58a876b7a2e0d5dda6954192c327627', '2022-07-06 00:54:53'),
(3, 3, 'staff1@example.com', 'dfd48f36338aa36228ebb9e204bba6b4e18db0b623e25c458901edc831fb18e9', '2022-07-06 00:54:53'),
(4, 3, 'staff2@example.com', 'dfd48f36338aa36228ebb9e204bba6b4e18db0b623e25c458901edc831fb18e9', '2022-07-06 00:54:53'),
(5, 4, 'student1@example.com', 'b2a1f4fd0a460606b34c8913e2981dac8d2e283d778aba586c416ee2629bfa54', '2022-07-06 00:55:33'),
(6, 4, 'student2@example.com', 'b2a1f4fd0a460606b34c8913e2981dac8d2e283d778aba586c416ee2629bfa54', '2022-07-14 06:01:27'),
(7, 4, 'student3@example.com', 'b2a1f4fd0a460606b34c8913e2981dac8d2e283d778aba586c416ee2629bfa54', '2022-07-14 06:01:27'),
(8, 5, 'company1@example.com', 'ea20133c853229bc6b2176035b44e37bdca391681784279ad4c3c3cf7c5945df', '2022-07-06 00:55:50'),
(9, 5, 'company2@example.com', 'ea20133c853229bc6b2176035b44e37bdca391681784279ad4c3c3cf7c5945df', '2022-07-06 00:55:50'),
(10, 5, 'company3@example.com', 'ea20133c853229bc6b2176035b44e37bdca391681784279ad4c3c3cf7c5945df', '2022-07-14 06:01:27');

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `RoleId` int(11) NOT NULL,
  `Description` varchar(255) NOT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `role` (`RoleId`, `Description`) VALUES
(1, 'Admin'),
(2, 'UnitCoordinator'),
(3, 'Staff'),
(4, 'Student'),
(5, 'Company');

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `EmployeeId` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(200) DEFAULT NULL,
  `LastName` varchar(200) DEFAULT NULL,
  `EmailAddress` varchar(200) DEFAULT NULL,
  `ContactNo` varchar(100) DEFAULT NULL,
  `Position` varchar(100) DEFAULT NULL,
  `RoleId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  PRIMARY KEY (`EmployeeId`),
  KEY `RoleId` (`RoleId`),
  KEY `UserId` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `employee` (`EmployeeId`, `FirstName`, `LastName`, `EmailAddress`, `ContactNo`, `Position`, `RoleId`, `UserId`) VALUES
(111111, 'Mike', 'Ross', 'admin@example.com', '046556546', 'Administrator', 1, 1),
(222222, 'Jonah', 'Hill', 'uc@example.com', '04564356345', 'Uni Coordinator', 2, 2),
(333333, 'Rich', 'Mills', 'staff1@example.com', 'sta0432432ff123', 'Tutor', 3, 3),
(444444, 'Peter', 'Parker', 'staff2@example.com', '04564356345', 'Tutor', 3, 2);


--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `StudentId` int(11) NOT NULL,
  `FirstName` varchar(200) DEFAULT NULL,
  `LastName` varchar(200) DEFAULT NULL,
  `EmailAddress` varchar(200) DEFAULT NULL,
  `ContactNo` varchar(100) DEFAULT NULL,
  `CourseCode` varchar(20) DEFAULT NULL,
  `SpecialisationCode` varchar(200) DEFAULT NULL,
  `YearEnrolled` varchar(50) DEFAULT NULL,
  `Nationality` varchar(50) DEFAULT NULL,
  `UserId` int(11) NOT NULL,
  PRIMARY KEY (`StudentId`),
  KEY `CourseCode` (`CourseCode`),
  KEY `SpecialisationCode` (`SpecialisationCode`),
  KEY `UserId` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `student` (`StudentId`, `FirstName`, `LastName`, `EmailAddress`, `ContactNo`, `CourseCode`, `SpecialisationCode`, `YearEnrolled`, `Nationality`, `UserId`) VALUES
(19513498, 'Garry', 'Dosen', 'student1@example.com', '0450547306', '3699', 'M3004', '2020', 'Ireland', 5),
(19513577, 'Jimmy', 'Smith', 'student2@example.com', '0476342506', '3699', 'M3001', '2020', 'Austalia', 6),
(18656456, 'Phillip', 'Carter', 'student3@example.com', '0420547312', '3698', 'M3003', '2022','Austria', 7);

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `CompanyId` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(200) DEFAULT NULL,
  `Industry` varchar(200) DEFAULT NULL,
  `Website` varchar(200) DEFAULT NULL,
  `OfficeNo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CompanyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `company` (`CompanyId`, `CompanyName`, `Industry`, `Website`, `OfficeNo`) VALUES
(1, 'Western Sydney University', 'Education', 'www.wsu.com', '543543543'),
(2, 'Westpac', 'Banking', 'www.westpac.com', '984986546');

--
-- Table structure for table `companycontact`
--

DROP TABLE IF EXISTS `companycontact`;
CREATE TABLE IF NOT EXISTS `companycontact` (
  `CompanyContactId` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(200) DEFAULT NULL,
  `LastName` varchar(200) DEFAULT NULL,
  `Role` varchar(100) DEFAULT NULL,
  `EmailAddress` varchar(200) DEFAULT NULL,
  `ContactNo` varchar(100) DEFAULT NULL,
  `CompanyId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  PRIMARY KEY (`CompanyContactId`),
  UNIQUE KEY `UserId` (`UserId`),
  KEY `CompanyId` (`CompanyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `companycontact` (`CompanyContactId`, `FirstName`, `LastName`, `Role`, `EmailAddress`, `ContactNo`, `CompanyId`, `UserId`) VALUES
(23232323, 'Rick', 'Koss', 'HR Manager', 'company1@example.com', '0408986513', 1, 8),
(34343434, 'Mike', 'Hill', 'Senior Developer', 'company2@example.com', '04042718823', 1, 9),
(45454545, 'Jane', 'Doe', 'Senior Web Developer', 'company3@example.com', '0408657875', 2, 7);

--
-- Table structure for table `internship`
--

DROP TABLE IF EXISTS `internship`;
CREATE TABLE IF NOT EXISTS `internship` (
  `InternshipId` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyId` int(11) NOT NULL,
  `CompanyContactId` int(11) NOT NULL,
  `JobRole` varchar(200) DEFAULT NULL,
  `Description` varchar(5000) DEFAULT NULL,
  `Location` varchar(400) DEFAULT NULL,
  `ClosingDate` date DEFAULT NULL,
  `JobApplication` varchar(100) DEFAULT NULL,
  `DatePosted` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`InternshipId`),
  KEY `CompanyId` (`CompanyId`),
  KEY `CompanyContactId` (`CompanyContactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `internship` (`InternshipId`, `JobRole`, `Description`, `CompanyId`, `CompanyContactId`, `Location`, `ClosingDate`, `JobApplication`) VALUES
(1, 'Web Developer', 
  'Experience in deploying and managing production environments in the public cloud (AWS/Azure/GCP)
  Proficient in Windows and Linux environments
  CD/CI experience with GitLab and Jenkins
  Hands on experience in container based architecture (Docker and Kubernetes)
  Coding experience in C++/C#/Java/Python
  Understanding of security and networking fundamentals', 
  1, 23232323, 'Parramatta', '2020-07-15', 'Go There Do things'),

(2, 'C++ Developer',
' Deployed monitoring tools such as Cloudwatch/Prometheus in a production setting 
 Exposure to Infrastructure As Code - Terraform/CloudFormation 
 Worked with the FIX protocol to communicate with providers 
 Proficiency in working with large data sets using KDB+ ', 
 1, 34343434, 'Kingswood', '2020-07-15', 'Go There Do things'),

(3, 'Java Developer', 
'Strong skills with HTML 5/CSS 3/JS - highly aware of the edges cases and cross-browser compatibility, and workarounds, in particular mobile web development
Strong skills with jQuery and jQuery related plugins
Developed API integrations with payment gateways, such as Stripe or Braintree
High awareness and experienced with the current CSS/JS modules and frameworks - understand their pro and cons, and being framework agnostic and unbiased in implementing solutions
High understanding and appreciate the importance of UI/UX design in building business websites
Understanding of technical SEO principles and implement best practices in web design', 
2, 45454545, 'Melbourne', '2020-07-15', 'Go There Do things');


--
-- Table structure for table `specialisation`
--

DROP TABLE IF EXISTS `specialisation`;
CREATE TABLE IF NOT EXISTS `specialisation` (
  `SpecialisationCode` varchar(40) NOT NULL,
  `SpecialisationName` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`SpecialisationCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `specialisation` (`SpecialisationCode`, `SpecialisationName`) VALUES
('M3001', 'Networking'),
('M3002', 'Distributed Computing'),
('M3003', 'Management'),
('M3004', 'Web and Mobile Computing'),
('M3005', 'Health Informatics'),
('M3006', 'Data Analytics'),
('M3007', 'Digital Futures'),
('M3008', 'Innovation and Entrepreneurship');

--
-- Table structure for table `student_completed_subjects`
--

CREATE TABLE IF NOT EXISTS `student_completed_subjects` (
    `StudentId` int(11) NOT NULL,
    `SubjectCode` varchar(80) NOT NULL,
    KEY `StudentId` (`StudentId`),
    KEY `SubjectCode` (`SubjectCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
    `CourseCode` varchar(80) NOT NULL,
    `CourseName` varchar(80) NOT NULL,
    PRIMARY KEY (`CourseCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `course` (`CourseCode`, `CourseName`) VALUES
('3765', 'Master of Artificial Intelligence'),
('3779', 'Master of Information Governance'),
('3699', 'Master of Information and Communications Technology'),
('3698', 'Master of Information and Communications Technology (Advanced)'),
('3780', 'Master of Information and Communications Technology/Master of Data Science');

--
-- Table structure for table `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
    `SubjectCode` varchar(80) NOT NULL,
    `SubjectName` varchar(80) NOT NULL,
    PRIMARY KEY (`SubjectCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `internship_approval_request`
--

CREATE TABLE IF NOT EXISTS `internship_approval_request` (
    `RequestId` int(8) NOT NULL AUTO_INCREMENT, 
    `StudentId` int(11) NOT NULL,
    `JobRole` varchar(80) DEFAULT NULL, 
    `JobDescription` varchar(200) DEFAULT NULL, 
    `EmployerName` varchar(80) DEFAULT NULL, 
    `EmployerRole` varchar(80) DEFAULT NULL, 
    `EmployerEmail` varchar(80) DEFAULT NULL, 
    `EmployerWebsite` varchar(100) DEFAULT NULL, 
    `EmployerContact` varchar(80) DEFAULT NULL,
    `OfferLetter` varchar(8000) DEFAULT NULL,
    `Outcome` varchar(80) DEFAULT 'Pending',
    `OutcomeDetails` varchar(200) DEFAULT NULL,
    KEY `StudentId` (`StudentId`),
    PRIMARY KEY (`RequestId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `student_internship`
--

CREATE TABLE IF NOT EXISTS `student_internship` (
    `StudentInternshipId` int(11) NOT NULL AUTO_INCREMENT,
    `InternshipId` int(11) NOT NULL,
    `StudentId` int(11) NOT NULL,
    `CompanyContactId` int(11) NOT NULL,
    `StartDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `EndDate` date DEFAULT NULL,
    `Status` varchar(20) DEFAULT 'On-going',
    KEY `InternshipId` (`InternshipId`),
    KEY `StudentId` (`StudentId`),
    KEY `CompanyContactId` (`CompanyContactId`),
    PRIMARY KEY (`StudentInternshipId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `student_work_experience`
--

CREATE TABLE IF NOT EXISTS `student_work_experience` (
    `WorkExpId` int(11) NOT NULL AUTO_INCREMENT,
    `StudentId` int(11) NOT NULL,
    `JobTitle` varchar(80) DEFAULT NULL,
    `EmployerName` varchar(80) DEFAULT NULL,
    `StartDate` varchar(80) DEFAULT NULL,
    `EndDate` varchar(80) DEFAULT NULL,
    `KeyResponsibilities` varchar(200) DEFAULT NULL,
    PRIMARY KEY (`WorkExpId`),
    KEY `StudentId` (`StudentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `support_ticket`
--

CREATE TABLE IF NOT EXISTS `support_ticket` (
    `TicketId` int(8) NOT NULL AUTO_INCREMENT, 
    `Subject` varchar(80) DEFAULT NULL,
    `Description` varchar(500) DEFAULT NULL,
    `Email` varchar(80) DEFAULT NULL,
    `Status` varchar(80) DEFAULT NULL,
    `UserId` int(11) DEFAULT NULL,
    PRIMARY KEY (`TicketId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `diary`
--

CREATE TABLE IF NOT EXISTS `diary` (
    `DiaryId` int(11) NOT NULL AUTO_INCREMENT, 
    `StartDate` varchar(80) DEFAULT NULL,
    `EndDate` varchar(80) DEFAULT NULL,
    `WorkingHours` int(11) DEFAULT NULL,
    `TaskCompleted` varchar(1000) DEFAULT NULL,
    `ManagerApprovalStatus` varchar(80) DEFAULT 'Pending',
    `ManagerComment` varchar(80) DEFAULT 'None',
    `AdminApprovalStatus` varchar(80) DEFAULT 'Pending',
    `AdminComment` varchar(80) DEFAULT 'None',
    `StudentId` int(11) NOT NULL,
    `InternshipId` int(11) NOT NULL,
    `CompanyContactId` int(11) NOT NULL,
    `DateSubmitted` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    KEY `StudentId` (`StudentId`),
    KEY `InternshipId` (`InternshipId`),
    KEY `CompanyContactId` (`CompanyContactId`),
    PRIMARY KEY (`DiaryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
CREATE TABLE IF NOT EXISTS `report` (
    `ReportId` int(11) NOT NULL AUTO_INCREMENT,
    `ReportDescription` varchar(10000) DEFAULT NULL,
    `StudentId` int(11) NOT NULL,
    `InternshipId` int(11) NOT NULL,
    `CompanyContactId` int(11) NOT NULL,
    `DateSubmitted` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    KEY `StudentId` (`StudentId`),
    KEY `InternshipId` (`InternshipId`),
    KEY `CompanyContactId` (`CompanyContactId`),
    PRIMARY KEY (`ReportId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
    `FeedbackId` int(11) NOT NULL AUTO_INCREMENT,
    `FeedbackDetailsId` int(11) NOT NULL,
    `StudentId` int(11) NOT NULL,
    `InternshipId` int(11) NOT NULL,
    `CompanyContactId` int(11) NOT NULL,
    `DateSubmitted` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    KEY `StudentId` (`StudentId`),
    KEY `InternshipId` (`InternshipId`),
    KEY `CompanyContactId` (`CompanyContactId`),
    KEY `FeedbackDetailsId` (`FeedbackDetailsId`),
    PRIMARY KEY (`FeedbackId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `feedback_details`
--

DROP TABLE IF EXISTS `feedback_details`;
CREATE TABLE IF NOT EXISTS `feedback_details` (
    `FeedbackDetailsId` int(11) NOT NULL AUTO_INCREMENT,
    `GWP_1` int(11) DEFAULT NULL,
    `GWP_2` int(11) DEFAULT NULL,
    `GWP_3` int(11) DEFAULT NULL,
    `GWP_4` int(11) DEFAULT NULL,
    `GWP_5` int(11) DEFAULT NULL,
    `GWP_6` int(11) DEFAULT NULL,
    `GWP_7` int(11) DEFAULT NULL,
    `SJAP_1` int(11) DEFAULT NULL,
    `SJAP_2` int(11) DEFAULT NULL,
    `SJAP_3` int(11) DEFAULT NULL,
    `SJAP_4` int(11) DEFAULT NULL,
    `SJAP_5` int(11) DEFAULT NULL,
    `SJAP_6` int(11) DEFAULT NULL,
    `SJAP_7` int(11) DEFAULT NULL,
    `SJAP_8` int(11) DEFAULT NULL,
    `SOP_1` varchar(80) DEFAULT NULL,
    `SOP_2` varchar(1000) DEFAULT NULL,
    `SOP_3` varchar(1000) DEFAULT NULL,
    `SOP_4` varchar(1000) DEFAULT NULL,
    `SOP_5` varchar(1000) DEFAULT NULL,
    `StartDate` varchar(80) DEFAULT NULL,
    `EndDate` varchar(80) DEFAULT NULL,
    `MinimumHoursCompleted` varchar(80) DEFAULT NULL,
    PRIMARY KEY (`FeedbackDetailsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for table `companycontact`
--
ALTER TABLE `companycontact`
  ADD CONSTRAINT `companycontact_fk_1` FOREIGN KEY (`UserId`) REFERENCES `login` (`UserId`) ON DELETE CASCADE,
  ADD CONSTRAINT `companycontact_fk_2` FOREIGN KEY (`CompanyId`) REFERENCES `company` (`CompanyId`) ON DELETE CASCADE;

--
-- Constraints for table `internship`
--
ALTER TABLE `internship`
  ADD CONSTRAINT `internship_fk_1` FOREIGN KEY (`CompanyId`) REFERENCES `company` (`CompanyId`) ON DELETE CASCADE,
  ADD CONSTRAINT `internship_fk_2` FOREIGN KEY (`CompanyContactId`) REFERENCES `companycontact` (`CompanyContactId`) ON DELETE CASCADE;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_fk_1` FOREIGN KEY (`RoleId`) REFERENCES `role` (`RoleId`) ON DELETE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_fk_1` FOREIGN KEY (`UserId`) REFERENCES `login` (`UserId`) ON DELETE CASCADE,
    ADD CONSTRAINT `employee_fk_2` FOREIGN KEY (`RoleId`) REFERENCES `role` (`RoleId`) ON DELETE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_fk_1` FOREIGN KEY (`CourseCode`) REFERENCES `course` (`CourseCode`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_fk_2` FOREIGN KEY (`SpecialisationCode`) REFERENCES `specialisation` (`SpecialisationCode`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_fk_3` FOREIGN KEY (`UserId`) REFERENCES `login` (`UserId`) ON DELETE CASCADE;

--
-- Constraints for table `student_internship`
--
ALTER TABLE `student_internship`
  ADD CONSTRAINT `student_internship_fk_1` FOREIGN KEY (`InternshipId`) REFERENCES `internship` (`InternshipId`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_internship_fk_2` FOREIGN KEY (`StudentId`) REFERENCES `student` (`StudentId`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_internship_fk_3` FOREIGN KEY (`CompanyContactId`) REFERENCES `companycontact` (`CompanyContactId`) ON DELETE CASCADE;

--
-- Constraints for table `student_completed_subjects`
--
ALTER TABLE `student_completed_subjects`
  ADD CONSTRAINT `student_completed_subjects_fk_1` FOREIGN KEY (`StudentId`) REFERENCES `student` (`StudentId`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_completed_subjects_fk_2` FOREIGN KEY (`SubjectCode`) REFERENCES `subject` (`SubjectCode`) ON DELETE CASCADE;

--
-- Constraints for table `student_work_experience`
--
ALTER TABLE `student_work_experience`
  ADD CONSTRAINT `student_work_experience_fk_1` FOREIGN KEY (`StudentId`) REFERENCES `student` (`StudentId`) ON DELETE CASCADE;
 
--
-- Constraints for table `internship_approval_request`
--
ALTER TABLE `internship_approval_request`
  ADD CONSTRAINT `internship_approval_request_fk_1` FOREIGN KEY (`StudentId`) REFERENCES `student` (`StudentId`) ON DELETE CASCADE;

--
-- Constraints for table `diary`
--
ALTER TABLE `diary`
  ADD CONSTRAINT `diary_fk_1` FOREIGN KEY (`StudentId`) REFERENCES `student` (`StudentId`) ON DELETE CASCADE,
  ADD CONSTRAINT `diary_fk_2` FOREIGN KEY (`InternshipId`) REFERENCES `internship` (`InternshipId`) ON DELETE CASCADE,
  ADD CONSTRAINT `diary_fk_3` FOREIGN KEY (`CompanyContactId`) REFERENCES `companycontact` (`CompanyContactId`) ON DELETE CASCADE;

--
-- Constraints for table `report`
--
ALTER TABLE `report`
    ADD CONSTRAINT `report_fk_1` FOREIGN KEY (`StudentId`) REFERENCES `student` (`StudentId`) ON DELETE CASCADE,
    ADD CONSTRAINT `report_fk_2` FOREIGN KEY (`InternshipId`) REFERENCES `internship` (`InternshipId`) ON DELETE CASCADE,
    ADD CONSTRAINT `report_fk_3` FOREIGN KEY (`CompanyContactId`) REFERENCES `companycontact` (`CompanyContactId`) ON DELETE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
    ADD CONSTRAINT `feedback_fk_1` FOREIGN KEY (`StudentId`) REFERENCES `student` (`StudentId`) ON DELETE CASCADE,
    ADD CONSTRAINT `feedback_fk_2` FOREIGN KEY (`InternshipId`) REFERENCES `internship` (`InternshipId`) ON DELETE CASCADE,
    ADD CONSTRAINT `feedback_fk_3` FOREIGN KEY (`CompanyContactId`) REFERENCES `companycontact` (`CompanyContactId`) ON DELETE CASCADE,
    ADD CONSTRAINT `feedback_fk_4` FOREIGN KEY (`FeedbackDetailsId`) REFERENCES `feedback_details` (`FeedbackDetailsId`) ON DELETE CASCADE;

COMMIT;
