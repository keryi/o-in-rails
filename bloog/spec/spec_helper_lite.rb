require 'rr'
require 'date'

def stub_module(full_name)
  full_name.to_s.split(/::/).inject(Object) do |ctx, name|
    begin
      ctx.const_get name
    rescue NameError
      ctx.const_set name, Module.new
    end
  end
end

def stub_class(name)
  begin
    Object.const_get name
  rescue NameError
    Object.const_set name, Class.new { def initialize(*args); end }
  end
end
