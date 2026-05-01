extends GutTest

func before_all():
	gut.p("Starting Input Driver Tests...")

func after_all():
	gut.p("Finished Input Driver Tests.")

func test_sanity_check():
	assert_eq(1, 1, "Math should work")

func test_plugin_manifest_structure():
	var manifest_path = "res://../plugin.cfg"
	assert_true(FileAccess.file_exists(manifest_path), "plugin.cfg should exist at the repo root")

	var config = ConfigFile.new()
	assert_eq(config.load(manifest_path), OK, "plugin.cfg should load")
	assert_eq(config.get_value("plugin", "name", ""), "AeroBeat Input Driver for Mouse", "plugin name should stay truthful")
	assert_true(config.get_value("plugin", "description", "").contains("UI/menu navigation"), "plugin description should call out UI/menu navigation")
	assert_true(config.get_value("plugin", "description", "").contains("not official v1 gameplay parity"), "plugin description should not imply official gameplay parity")

func test_addons_manifest_uses_input_core_lane_dependency():
	var manifest_path = "res://addons.jsonc"
	assert_true(FileAccess.file_exists(manifest_path), "addons.jsonc should exist in the testbed")

	var content = FileAccess.get_file_as_string(manifest_path)
	assert_true(content.contains('"aerobeat-input-core"'), "manifest should pin aerobeat-input-core")
	assert_false(content.contains('"aerobeat-core"'), "manifest should not pin the old aerobeat-core key")
