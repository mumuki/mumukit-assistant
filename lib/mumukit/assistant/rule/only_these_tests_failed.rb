class Mumukit::Assistant::Rule::OnlyTheseTestsFailed < Mumukit::Assistant::Rule::TheseTestsFailed
  def matches_failing_tests?(submission)
    super && failed_tests(submission).count == @tests.count
  end
end