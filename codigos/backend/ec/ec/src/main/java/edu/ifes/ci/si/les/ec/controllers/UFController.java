@RestController()
@RequestMapping(value = "/uf")
public class UFController {
  @Autowired
  private UFService service;

  @RequestMapping(method = RequestMethod.POST)
  public ResponseEntity<UF> insert(@Valid @RequestBody UF obj, BindingResult br) {
    if (br.hasErrors())
      throw new ConstraintException(br.getAllErrors().get(0).getDefaultMessage());
    obj = service.insert(obj);
    return ResponseEntity.ok().body(obj);
  }

  @RequestMapping(value = "/{id}", method = RequestMethod.GET)
  public ResponseEntity<UF> find(@PathVariable Integer id) {
    UF obj = service.findById(id);
    return ResponseEntity.ok().body(obj);
  }

  @RequestMapping(method = RequestMethod.GET)
  public ResponseEntity<Collection<UF>> findAll() {
    Collection<UF> collection = service.findAll();
    return ResponseEntity.ok().body(collection);
  }

  @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
  public ResponseEntity<UF> update(@Valid @RequestBody UF obj, BindingResult br) {
    if (br.hasErrors())
      throw new ConstraintException(br.getAllErrors().get(0).getDefaultMessage());
      obj = service.update(obj);
      return ResponseEntity.ok().body(obj);
  }

  @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
  public ResponseEntity<Void> delete(@PathVariable Integer id) {
    service.delete(id);
    return ResponseEntity.noContent().build();
  }
}