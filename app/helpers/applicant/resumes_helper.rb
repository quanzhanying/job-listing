module Applicant::ResumesHelper

	def texts_depend_on_existance_of_resume(resume)
		if resume.attachment?
			'Replace with another Resume'
		else
			'Upload a Resume'
		end
	end
end
