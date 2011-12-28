require 'rbconfig'

module GemJacker
  # Push the configured path out to the system. By default, inherit
  # the system path and set its priority level to 0.
  def self.deploy(inherit_sys=true, sys_level=0)
    if inherit_sys
      GemJacker::ExecutablePaths.inherit_sys_path(sys_level)
    end
    GemJacker::ExecutablePaths.replace_sys_path
  end

  class ExecutablePaths
    @@original_sys_path = nil

    def self.sys_path_sep
      if /mswin|mingw/.match(RbConfig::CONFIG['host_os'])
        ';'
      else
        ':'
      end
    end

    # Load the system path with a specified priority.
    def self.inherit_sys_path(priority=0)
      @@path ||= []

      sys_path = ENV['PATH'].split(sys_path_sep)

      @@path += sys_path.map do |p| 
        {:path => p, :priority => priority}
      end
    end

    # Clears the path.
    def self.reset_path
      @@path = []
    end

    # Expects a path and a priority. Higher priority is seached first
    # Priority defaults to zero. Negative priorities are allowed.
    def self.add_path(path, priority=0)
      @@path ||= []
      @@path << {:path => path, :priority => priority}
    end

    def self.raw_path
      @@path ||= []
    end

    # Returns the priority-sorted (highest first) list of search paths.
    def self.path
      @@path.sort {|a, b| a[:priority] <=> b[:priority]}.map do |p|
        p[:path]
      end.reverse
    end

    # Returns the system path to its original value
    def self.reset_sys_path_to_original
      ENV['PATH'] = @@original_sys_path if @@original_sys_path
    end

    # Replaces the system path with the GemJacker path.
    def self.replace_sys_path
      @@original_sys_path ||= ENV['PATH']
      ENV['PATH'] = path.join(sys_path_sep)
    end
  end
end
