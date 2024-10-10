# frozen_string_literal: true

class StatisticsApi < Grape::API
  format :json

  resource :statistics do
    desc 'Добавить статистику'
    params do
      requires :footballer_id, type: Integer, desc: 'ID игрока'
      requires :match_id, type: Integer, desc: 'ID матча'
      requires :goals, type: Integer, desc: 'Количество голов'
      requires :assists, type: Integer, desc: 'Количество ассистов'
      requires :saves, type: Integer, desc: 'Количество сейвов'
      requires :kicks_on_goal, type: Integer, desc: 'Количество ударов по воротам'
    end
    post do
      statistic = Statistic.create!(
        footballer_id: params[:footballer_id],
        match_id: params[:match_id],
        goals: params[:goals],
        assists: params[:assists],
        saves: params[:saves],
        kicks_on_goal: params[:kicks_on_goal]
      )
      { message: 'Statistic was successfully created', status: :ok, statistic: }
    end
  end

  resource :ratings do
    desc 'Получить рейтинг игроков'
    params do
      optional :limit, type: Integer, default: 5, desc: 'Количество топ игроков'
      requires :role, type: Integer, desc: 'Роль игрока (вводить число: 0 - нападающий, 1 - полузащитник, 2 - защитник, 3 - вратарь)'
      requires :team, type: String, desc: 'Команда игрока'
      requires :start_date, type: String, desc: 'Дата начала (вводить в формате - год-месяц-число: пр. 2012-05-21)'
      requires :end_date, type: String, desc: 'Дата окончания (вводить в формате - год-месяц-число: пр. 2012-05-21)'
    end
    get do
      result = CalculateRatingService.top_footballers(limit: params[:limit], role: params[:role],
                                                      team: params[:team], start_date: params[:start_date],
                                                      end_date: params[:end_date])
      { status: :ok, top_footballers: result }
    end
  end
end  
