module uim.systems.views.components.forms.groups.valid;

@safe:
import uim.systems;

class DCTLValidDatesFormGroup : DAPPStartEndDateFormGroup {
  mixin(APPFormComponentThis!("CTLValidDatesFormGroup", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_active")
    .name("entity_active")
    .label("Gültig")
    .fieldName("active")
    .fieldValue("false");
  }

  override DH5Obj h5StartInput(STRINGAA options = null) {
    return APPDateFormGroup.id("entity_validFrom").name("entity_validFrom").h5Input(options);
  }

  override DH5Obj h5EndInput(STRINGAA options = null) {
    return APPDateFormGroup.id("entity_validUntil").name("entity_validUntil").h5Input(options);
  }
}
mixin(APPFormComponentCalls!("CTLValidDatesFormGroup", true));
