def stub_module(full_name)
  full_name.to_s.split(/::/).inject(Object) do |ctx, name|
    begin
      ctx.const_get name
    rescue NameError
      ctx.const_set name, Module.new
    end
  end
end
