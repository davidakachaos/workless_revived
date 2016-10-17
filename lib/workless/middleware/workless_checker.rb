class WorklessChecker
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)

    Delayed::Job.scaler.up if Delayed::Job.scaler.jobs.size > 0
    
    return [status, headers, response]
  end

end
