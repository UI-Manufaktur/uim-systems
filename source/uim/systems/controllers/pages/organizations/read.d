module uim.systems.controllers.pages.organizations.read;

@safe:
import uim.systems;

class DSystemOrganizationReadPageController : DSystemReadPageController {
  mixin(APPPageControllerThis!("SystemOrganizationReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("system_organizations")
      .rootPath("/system/organizations");

    auto myView = APPEntityReadView(this)
      .rootPath(this.rootPath);

    if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "System")
        .link(["href":this.rootPath], "Organizations")
        .item(["active", "fw-bold"], "Anzeigen")
      );

      myHeader
        .breadcrumbs(bc)
        .title(titleCreate("Organization anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/read")
        .content(
          SystemOrganizationFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Organizations")
          .subTitle("Organization anzeigen");      
      }

      this
        .scripts
          .addContents(
            editorSummary~
            editorText~
            "editorSummary.disabled();"~
            "editorText.disabled();"
          );
    }

    this
      .view(myView);
  }
}
mixin(APPPageControllerCalls!("SystemOrganizationReadPageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemOrganizationReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemOrganizationReadPageController); 
}}