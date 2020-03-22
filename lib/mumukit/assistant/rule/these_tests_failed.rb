class Mumukit::Assistant::Rule::TheseTestsFailed < Mumukit::Assistant::Rule::SubmissionFailed
  def initialize(message, tests)
    raise 'missing tests' if tests.blank?
    super(message)
    @tests = tests
  end

  def matches?(submission)
    super && matches_failing_tests?(submission)
  end

  def matches_failing_tests?(submission)
    @tests.all? do |it|
      includes_failing_test? it, submission
    end
  end

  def includes_failing_test?(title, submission)
    failed_tests(submission).map { |it| it[:title].strip }.include?(title.strip)
  end

  def failed_tests(submission)
    @failed_tests ||= submission.test_results.select { |it| it[:status].failed? }
  end
end
