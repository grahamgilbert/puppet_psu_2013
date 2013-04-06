module Puppet::Parser::Functions
 newfunction(:pick, :type => :rvalue) do |args|
   args = args.compact
   args.delete(:undef)
   args.delete("")
   if args[0].to_s.empty? then
     fail "Must provide non empty value."
   else
     return args[0]
   end
 end
end
