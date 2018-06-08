class Mumukit::Assistant::Rule::SubmissionErrored < Mumukit::Assistant::Rule::Base
  def matches?(submission)
    submission.status.errored?
  end
end