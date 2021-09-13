public class Cargo extends Pessoa {
  private int id_cargo;
  private String cargo;
  private float salario;
  private float salario_base;

  public Cargo() {
    super();
  }

  public int getId_cargo(){
    return id_cargo;
  }

  public String getCargo(){
    return cargo;
  }
  public void setCargo(String cargo){
    this.cargo = cargo;
  }

  public float getSalario() {
    return salario;
  }
  public void setSalario(float salario) {
    this.salario = salario;
  }

  public float getSalario_base() {
    return salario_base;
  }
  public void setSalario_base(float salario_base) {
    this.salario_base = salario_base;
  }
}
