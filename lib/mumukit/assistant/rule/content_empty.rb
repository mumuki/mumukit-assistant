class Mumukit::Assistant::Rule::ContentEmpty < Mumukit::Assistant::Rule::Base
  def matches?(submission)
    submission.solution.blank?
  end
end
