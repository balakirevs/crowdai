  class SubmissionsRemainingQuery

  def initialize(challenge:, participant_id:)
    @challenge = challenge
    @participant_id = participant_id
  end

  # returns:
  # submissions remaining
  # reset dttm
  # array of submissions already made in this period

  def call
    if @challenge.running?
      remaining = send(@challenge
        .current_round
        .submission_limit_period_cd.to_s)
    else
      return [1,nil,[]]
    end
    return remaining
  end


  def day
    submissions = @challenge
      .submissions
      .where(
          "participant_id = ? and created_at >= ?",
          @participant_id,
          Time.zone.now - 24.hours)
      .order(created_at: :asc)
    if submissions.blank?
      remaining = [
        (@challenge.current_round.submission_limit),
        nil,
        previous_submissions(submissions: submissions)
      ]
    else
      remaining = [
        (@challenge.current_round.submission_limit - submissions.count),
        (submissions.first.created_at + 1.day).to_s,
        previous_submissions(submissions: submissions)
      ]
    end
    return remaining
  end

  def week
    submissions = @challenge
      .submissions
      .where(
        "participant_id = ? and created_at >= ?", @participant_id,
        Time.zone.now - 7.days)
      .order(created_at: :asc)
    if submissions.blank?
      remaining = [
        (@challenge.current_round.submission_limit),
        nil,
        previous_submissions(submissions: submissions)
      ]
    else
      remaining = [
        (@challenge.current_round.submission_limit - submissions.count),
        (submissions.first.created_at + 1.week).to_s,
        previous_submissions(submissions: submissions)
      ]
    end
    return remaining
  end

  def round
    submissions = @challenge
      .submissions
      .where(
        "post_challenge IS FALSE and participant_id = ? and challenge_round_id = ?",
        @participant_id,
        @challenge.current_round.id)
    if submissions.blank?
      remaining = [
        (@challenge.current_round.submission_limit),
        nil,
        previous_submissions(submissions: submissions)
      ]
    else
      remaining = [
        (@challenge.current_round.submission_limit - submissions.count),
        nil,
        previous_submissions(submissions: submissions)
      ]
    end
    return remaining
  end

  def previous_submissions(submissions:)
    submissions.map {|s| [s.id, s.grading_status_cd, s.created_at]}
  end

end
