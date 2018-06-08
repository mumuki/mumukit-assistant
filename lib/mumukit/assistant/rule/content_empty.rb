class Mumukit::Assistant::Rule::ContentEmpty < Mumukit::Assistant::Rule::Base
  def matches?(submission)
    submission.content.empty?
  end
end