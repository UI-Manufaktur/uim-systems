module uim.systems.controllers.pages.users.create;

@safe:
import uim.systems;

class DSystemTenantCreatePageController : DSystemCreatePageController {
  mixin(APPPageControllerThis!("SystemTenantCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("system_users")
      .rootPath("/system/users");

    auto myView = APPEntityCreateView(this)
      .rootPath(this.rootPath);
    
    if (auto myHeader = cast(DPageHeader)myView.header) {
      myHeader
        .rootPath(this.rootPath)
        .title(titleCreate("Tenant erstellen"))
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/"], "UIM")
            .link(["href":"/system"], "System")
            .link(["href":this.rootPath], "Anwender")
            .item(["active", "fw-bold"], "Erstellen")
          ));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .rootPath(this.rootPath)
        .method("post")
        .action(this.rootPath~"/actions/create")
        .content(
          SystemTenantFormContent(
            myForm
        ));
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .rootPath(this.rootPath)
            .mainTitle("Neuer Anwender")
            .subTitle("Bitte Werte eingeben")
            .actions([["cancel", "save"]]);
      }

      this
        .scripts
          .addContents(
            editorSummary~editorText,
            "window.addEventListener('load', (event) => {
              document.getElementById('"~myForm.id~"').addEventListener('submit', event => {
                editorSummary.save();
                editorText.save();
              })
            });"
        );    
    }

    this
      .view(myView);      
  }
}
mixin(APPPageControllerCalls!("SystemTenantCreatePageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new SystemTenantCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemTenantCreatePageController); 
}}