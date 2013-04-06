Puppet::Type.newtype(:printer) do
  @doc = "Manage installed printers and printer queues on a puppet node."

  ensurable

  newparam(:name, :isnamevar => true) do
    desc "The name of the printer, any character except SPACE, TAB, / or #, Not case sensitive"

    validate do |value|
      raise ArgumentError, "%s is not a valid printer name" % value if value =~ /[\s\t\/#]/
    end
  end

  # Classes are not yet supported.
  #newproperty(:class) do
  #  desc "Adds the named printer to the specified class. If the class does not exist it is created automatically.
  #
  #  "
  #end

  #newproperty(:allow) do
  #  desc "Specifically allow users and/or groups to print to this destination."
  #end
  #
  #newproperty(:deny) do
  #  desc "Specifically deny users and/or groups to print to this destination."
  #end

  newproperty(:uri) do
    desc "Sets the device-uri attribute of the printer destination."
  end

  newproperty(:description) do
    desc "Provides a textual description of the destination."
  end

  newproperty(:location) do
    desc "Provides a textual location of the destination."
  end

  newproperty(:model) do
    desc "Sets a standard System V interface script or PPD file for the printer from the model directory.

    Use the -m option with the lpinfo(8) command to get a list of supported models.
    "
  end

  newproperty(:ppd) do
    desc "Specifies a PostScript Printer Description file to use with the printer."
  end

  newproperty(:enabled) do
    desc "Enables the destination and accepts jobs"

    newvalues(:true, :false)
    defaultto :true
  end

  newproperty(:accept) do
    desc "Specifies whether the destination will accept jobs, or reject them."

    newvalues(:true, :false)
    defaultto :true
  end

  newparam(:shared) do
    desc "Sets the destination to shared/published or unshared/unpublished."

    newvalues(:true, :false)
    defaultto :false
  end

  newparam(:options) do
    desc "Sets a list of PPD options for the printer"

    validate do |value|
      raise ArgumentError, "invalid value supplied for printer options" unless value.is_a? Hash
    end
  end

  # Allow a printer resource without explicitly specifying a file resource for the PPD.
  autorequire(:file) do
     self[:ppd] if self[:ppd]
  end
end
