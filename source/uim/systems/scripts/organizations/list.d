module uim.systems.scripts.systems.organizations.list;

@safe:
import uim.systems;
import uim.systems.scripts.systems.organizations;

auto listEntities() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~
    jsLet([
      "unsortButtons":"[nameSort, displaySort]",
      "sortButtons":"[nameUp, nameDown, displayUp, displayDown]",
    ])~

    jsFetchEntities()~
    jsListEntities()~
    jsRenderEntities()~
    jsDoSelectEntities()~

    jsEvent("viewEntities", "'input'", "doPageEntities")~
    jsEvent("prevEntities", "'click'", "goPrevEntities")~
    jsEvent("nextEntities", "'click'", "goNextEntities")~
    jsEvent("btnClearSearch", "'click'", "clearSearch")~
    jsEvent("headDisplay", "'click'", "sortDisplay")~
    jsEvent("headName", "'click'", "sortName")~
    jsEvent("cbSelectAllEntities", "'click'", "doSelectEntities");

}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/list.js", "w"); // open for writing
  f.write(listEntities);
}
