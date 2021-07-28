# frozen_string_literal: true

require 'csv'
require 'gtk3'
require 'uri'
require '../services/readers_writers/path_service'

class UserInterface < Gtk::Window
  attr_accessor :path, :mode, :path_to_dir

  def initialize
    on_create_ui
  end

  private

  def on_create_ui
    dialog = init_dialog
    dialog.add_filter(add_filter)
    toggle = add_toggle
    dialog.extra_widget = toggle
    set_params(toggle, dialog.uri) if dialog.run == Gtk::ResponseType::ACCEPT
  end

  def init_dialog
    my_title = 'Select a file with logs'
    my_action = Gtk::FileChooserAction::OPEN
    Gtk::FileChooserDialog.new(title: my_title, action: my_action, buttons: add_buttons)
  end

  def add_buttons
    button_open_file = [Gtk::Stock::OPEN, Gtk::ResponseType::ACCEPT]
    button_cancel = [Gtk::Stock::CANCEL, Gtk::ResponseType::CANCEL]
    [button_open_file, button_cancel]
  end

  def add_filter
    filter_log = Gtk::FileFilter.new
    filter_log.name = 'log'
    filter_log.add_pattern('*.log')
  end

  def add_toggle
    toggle = Gtk::CheckButton.new('Set unique entries')
    toggle.show
    toggle
  end

  def set_on_click_toggle(toggle)
    toggle.active? ? 'unique' : 'all'
  end

  def set_params(toggle, dialog_uri)
    service = ReadersWriters::PathService.new(dialog_uri)
    self.mode = set_on_click_toggle(toggle)
    self.path = service.call(:read_path)
    self.path_to_dir = service.call(:write_path)
  end
end
