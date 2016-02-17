class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  around_filter do
    $cells_time = 0
    yield
    puts puts "#{self.class}##{state} %0.3fms" % $cells_time
  end
end
