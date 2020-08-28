# encoding: utf-8

require 'csv'
require 'open3'

# [moosh](https://moosh-online.com/) wrapper for Ruby.
class Moosh
  attr_reader :command_line_base

  attr_accessor :moosh_path, :moodle_path

  def initialize(moosh_path, moodle_path)
    @moosh_path = moosh_path
    @moodle_path = moodle_path
    
    @command_line_base = "sudo -u www-data #{@moosh_path}/moosh.php -p #{@moodle_path} " 
  end
  
  def execute_command(command_line)
    puts command_line
    output, error, status = Open3.capture3(command_line)
    return output, error, status
  end
  
  def activity_add()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def activity_config_set()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def activity_delete()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def activity_move()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def admin_login()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def admin_remove_orphaned_modules()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def apache_parse_extendedlog()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def apache_parse_missing_files()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def apache_parse_perflog()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def audit_passwords()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def auth_list()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def auth_manage()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def backup_info()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def base_path()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def block_add()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def block_manage()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def cache_clear()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def cache_course_rebuild()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def cache_test()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def category_config_set()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def category_create()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def category_delete()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def category_export()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def category_import()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def category_list()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def category_move()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def category_resortcourses()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def chkdatadir()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def code_check()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def cohort_create()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def cohort_enrol()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def cohort_unenrol()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def config_get()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def config_plugins()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def config_set()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def course_backup()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def course_cleanup()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def course_config_set()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def course_create()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def course_delete()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def course_enableselfenrol()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def course_enrol()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def course_enrolbyname()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  
  def course_info(course_id)
    # The data type of the course_id must be Integer.
    if !course_id.is_a?(Integer)
      raise "invalid course_id #{course_id}"
    end
    
    command_line = "#{@command_line_base} course-info #{course_id}"

    output, error, status = execute_command(command_line)

    if output =~ /^Course ID/ then
      return output
      # [output.index(/Course ID/) .. ]
    else
      raise "The course with course_id #{course_id} does not exist."
    end
  end

  def course_list()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def course_reset()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def course_restore()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def course_unenrol()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def data_stats()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def db_stats()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def debug_off()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def debug_on()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def delete_missingplugins()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def dev_langusage()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def dev_versionbump()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def download_moodle()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def event_fire()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def event_list()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def file_check()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def file_datacheck()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def file_dbcheck()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def file_delete()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def file_hash_delete()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def file_list()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def file_path()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def file_upload()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def filter_set()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def fontawesome_refreshcache()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def form_add()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def forum_newdiscussion()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def framework_import()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def generate_availability()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def generate_block()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def generate_cfg()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def generate_enrol()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def generate_filemanager()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def generate_form()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def generate_gradeexport()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def generate_gradereport()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def generate_lang()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def generate_local()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def generate_messageoutput()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def generate_module()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def generate_moosh()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def generate_qtype()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def generate_userprofilefield()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def generate_ws()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  
  module ExportFeedback
    ON = 1.freeze
    OFF = 0.freeze
  end
  module OnlyActive
    ON = 1.freeze
    OFF = 0.freeze
  end
  module DisplayType
    REAL = 1.freeze
    PERCENTAGE = 2.freeze
    LETTER = 3.freeze
  end
  module Separator
    COMMA = "comma".freeze
    TAB = "tab".freeze
  end
  module ExportFormat
    ODS = "ods".freeze
    TXT = "txt".freeze
    XLS = "xls".freeze
    XML = "xml".freeze
  end
  
  def gradebook_export(course_id)
    # The data type of the course_id must be Integer.
    if !course_id.is_a?(Integer)
      raise "Invalid course_id #{course_id}."
    end
    if course_info(course_id).empty? then
      raise "There is no course with course id #{course_id}."
    end

    group_id = 0
    exportfeedback = ExportFeedback::OFF
    onlyactive = OnlyActive::ON
    displaytype = DisplayType::PERCENTAGE
    decimalpoints = 2
    if !(decimalpoints.is_a?(Integer) && decimalpoints >= 0) then
      raise "Invalid decimalpoints is specified #{decimalpoints}."
    end
    separator = Separator::COMMA
    exportformat = ExportFormat::TXT

    # Only gradeitems with the specified course_id are extracted.
    gradeitems = gradeitem_list(course_id)
    if gradeitems.length < 1 then
      # In some cases, there is no gradeitem in a course, so it is treated as normal.
      STDERR.puts "gradeitems is empty. Probably there is no gradeitem in the course #{course_id}."
      return
    end
    # Only gradeitem_ids are extracted.
    gradeitem_ids = gradeitems.map {|item| item["id"] }
    
    
    command_line = "#{@command_line_base} gradebook-export -g #{group_id} -x #{exportfeedback} -a #{onlyactive} -d #{displaytype} -p #{decimalpoints} -s #{separator} -f #{exportformat} #{gradeitem_ids.join(',')} #{course_id}"

    output, error, status = execute_command(command_line)
    return CSV.parse(output,{headers: true})
  end

  def gradebook_import()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def gradecategory_create()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def gradecategory_list()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def gradeitem_create()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end

  def gradeitem_list(course_id=nil)
    if !course_id.nil? && !course_id.is_a?(Integer) then
      raise "Invalid course_id #{course_id}."
    end
  
    command_line = "#{@command_line_base} gradeitem-list"

    output, error, status = execute_command(command_line)
    csvdata = CSV.parse(output, {headers: true})

    if course_id.nil? then
      # Return all data if course_id method parameter does not specified.
      return csvdata
    else
      # Extract the data by course_id.
      csvdata_id = CSV::Table.new(
        csvdata.select {|x|
          x["courseid"] == course_id.to_s
        })
      return csvdata_id
    end
  end

  def group_assigngrouping()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def group_create()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def group_delete()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def group_list()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def group_memberadd()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def grouping_create()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def info()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def info_context()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def info_plugins()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def lang_compare()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def languages_update()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def maintenance_off()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def maintenance_on()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def module_config()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def module_manage()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def module_reinstall()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def nagios_check()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def perf_analyse()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def php_eval()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def plugin_install()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def plugin_list()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def plugin_uninstall()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def plugins_usage()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def question_import()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def questioncategory_create()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def random_label()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def report_concurrency()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def restore_settings()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def role_create()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def role_delete()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def role_list()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def role_reset()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def role_update_capability()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def role_update_contextlevel()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def sql_cli()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def sql_dump()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def sql_run()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def theme_info()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def theme_settings_export()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def theme_settings_import()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def top()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def user_assign_system_role()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def user_create()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def user_delete()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def user_export()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def user_import_pictures()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def user_list()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def user_login()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def user_mod()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def user_unassign_system_role()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def userprofilefields_export()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def userprofilefields_import()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def webservice_call()
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
end