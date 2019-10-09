class Mumukit::Assistant::Rule::OnlyTheseExpectationsFailed < Mumukit::Assistant::Rule::TheseExpectationsFailed
  def matches_failing_expectations?(submission)
    super && failed_expectations(submission).count == @expectations.count
  end

  def failed_expectations(submission)
  end
end