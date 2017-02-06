# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: "admin@gmail.com", password: "123456", password_confirmation: "123456", is_admin: true)
User.create!(email: "123@gmail.com", password: "123456", password_confirmation: "123456", is_admin: false)

	Job.create!(title: "IT Security Architect Manager", description: "RESPONSIBILITIES:

Provide advice as a subject matter expert in IT Security
Implement IT Security tools and technologies effectively
Liaise with the enterprise architecture team to build IT security into the architecture
Perform IT Security assessments of the technical IT Security infrastructure and application controls in place and provide recommendations for improvement
Keep abreast of IT related technologies and provide advice on the impact to Information Security
Undertake ad-hoc tasks assigned by the supervisor

REQUIREMENTS:

Degree in Information Technology, Computer Science, Information Systems, or equivalent.
At least 5 years of working experience in areas related to IT security.
Knowledge in information security standards such as: ISO27001, COBIT, ITIL, PCI, MAS TRM, OWASP.
Professional Certifications such as CISA, CISSP or CISM or other relevant qualifications will be an added advantage.
A team player, resourceful, independent and ability to communicate (both written and verbal) effectively
An all-rounded player having strong fundamentals in different IT functions, and the ability to align business objectives.", wage_lower_bound: 8000, wage_upper_bound: 15000, contact_email: "test123@gmail.com",
	is_hidden: false)

  Job.create!(title: "Software Engineer (J2EE Technology)", description: "Responsibilities:

- Deliver projects which include business and functional analysis of requirements, business / process re-engineering
- Recommend, design and deliver solutions to meet business requirements
- Conduct system tests and commissioning
- Provide IT support and training to end-users
- Manage project and ensure timely delivery of project
- Lead team to implement, maintain and support the system.
- Guide team on good software coding practice, software architectural design and system documentation
- Vendor management

Requirements:

- Degree in Computer Science / IT or equivalent
- Minimum of 4-5 years experience in J2EE technology such as JSP/Servlet, EJB, XML, JMS, Ajax, Struts, Spring, preferably with project management experience and has undergone full SDLC
- Sound technical knowledge of client/server and Java/J2EE environment, Web and smartphone technology
- Strong analytical skills
- Team player with good interpersonal and communication skills
- Committed to project delivery in a fast paced environment", wage_lower_bound: 5000, wage_upper_bound: 10000, contact_email: "test456@gmail.com",
  is_hidden: false)

  Job.create!(title: "Science Officer — Addest Technovation", description: "Main job responsibilities:

facilitate hands-on workshops/laboratory sessions for teachers and pupils,
design experiments and edit activity manuals
develop contents

Requirements:

Degree or Diploma in Science (preferably major in Chemistry)
Passion for Science
Committed and willingness to work extra
", wage_lower_bound: 1000, wage_upper_bound: 20000, contact_email: "",
  is_hidden: false)

  Job.create!(title: "Infrastructure Specialist", description: "Provide service desk logging and support for all incident calls related to IT hardware/software
applications.
• Install, configure, administer & maintain IT equipment (desktops, laptops, printers and network
peripherals).
• Responsible in troubleshooting including the diagnosing of hardware and software failures or problems.
• Responsible for all Infrastructure functions.
• Assists to maintain network performance by performing network monitoring and analysis, and
performance tuning; troubleshooting network problems.
• Assists with procurement and maintain up to date inventory tracking.
• Assist in project implementation such as network upgrade by conferring with vendors; developing,
testing, evaluating, and installing enhancements.
• Perform data backups and disaster recovery operations.
• Standby to support outlet system operation on rotating shift.
• Perform any other duties as assigned by Senior/IT Manager.



REQUIREMENTS
• Diploma / ITE in Computer Engineering or Information Technology or equivalent.
• Minimum 2 years of relevant work experience, preferably from FMCG or fast pace retail environment.
", wage_lower_bound: 8000, wage_upper_bound: 20000, contact_email: "123demo@gmail.com",
  is_hidden: false)

  Job.create!(title: "System Analyst (.NET)", description: "JOB FUNCTIONS
• Provide service desk logging and support for all incident calls related to IT software/hardware applications.
• Analyze, design, program, test, document and maintain IT systems or applications which align with business needs.
• To generate sales/inventory/stock reports as business needs by using SQL script/other software tools.
• To assist with procurement and maintain up to date inventory tracking.
• Responsible for Corporate Systems function: Retail-Merchandising systems, Report Manager, Night Batch Schedule, Webapps, Platinum, Claims Automation, Time Attendance and any others function as assigned by Senior/IT Manager.
• Standby to support outlet system operation on rotating shift.
• Assist in project implementation such as upgrade/update of workstation, LAN and running system test.
• Perform any other duties as assigned by Senior/IT Manager.

REQUIREMENTS

• Diploma / Degree in Computer Engineering or Information Technology or equivalent.
• Minimum 1 year of relevant work experience, preferably from FMCG or fast pace retail environment.
• Experience in system integration is an added advantages.
• Strong Skills in the following development platforms
MS SQL/SYBASE ASE
VB.net / C#
SQL Report Server", wage_lower_bound: 5000, wage_upper_bound: 12000, contact_email: "456demo@gmail.com",
  is_hidden: false)

  Job.create!(title: "SAP BW Support Consultant", description: "Requirements:

- min. 4-5 years SAP BW expertise
- Senior knowledge of SAP BW monitoring
- SAP BW implementation experience is of advantage
- Previous work in a SAP support environment is a MUST
- Good communication skills
- Willing to on public holidays (with compensation)
- Good knowledge of MS Office such as Excel and PowerPoint

You will be working for our international customer base where a professional work attitude and reliability are essential.

We offer attractive pay as well as remote work for after office hours.

If interested please apply.
", wage_lower_bound: 10000, wage_upper_bound: 25000, contact_email: "123demo@gmail.com",
  is_hidden: false)
