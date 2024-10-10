# frozen_string_literal: true

class CalculateRatingService
  def self.calculate(statistic)
    case statistic.footballer.role
    when 'goalkeeper'
      (statistic.saves / statistic.goals + statistic.saves) * statistic.match.weight
    when 'defender'
      (statistic.saves * 2 + statistic.match.weight) * statistic.match.weight
    when 'midfielder'
      (statistic.assists * 3 + statistic.match.weight) * statistic.match.weight
    when 'forward'
      (statistic.goals * 3 + statistic.assists * 2 + statistic.match.weight) * statistic.match.weight
    else
      nil
    end
  end

  def self.top_footballers(limit: 5, role: nil, team: nil, start_date:, end_date:)

    statistics = Statistic.joins(:footballer, :match).where(matches: { date: start_date..end_date })

    statistics = statistics.where(footballers: { role:, team: })

    footballer_ratings = statistics.group_by(&:footballer).map do |footballer, stats|
      rating = stats.sum { |stat| calculate(stat) }
      { footballer:, rating: }
    end

    top_footballers = footballer_ratings.sort_by { |fr| -fr[:rating] }.first(limit)

    top_footballers
  end
end
