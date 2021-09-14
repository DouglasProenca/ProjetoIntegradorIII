import java.util.Date;

public class Pessoa {
  private int id;
  private int id_filial;
  private int id_categoria;
  private int id_colaborador;
  private String nome;
  private String sexo;
  private String email;
  private String CPF;
  private String celular;
  private String telResidencial;
  private String telComercial;
  private String estadoCivil;
  private String obs;
  private Date dataNascimento;
  private Date data_;

  public Pessoa(){

  }

  public int getId() {
    return id;
  }

  public int getId_filial() {
    return id_filial;
  }
  public void setId_filial(int id_filial) {
    this.id_filial = id_filial;
  }

  public int getId_categoria() {
    return id_categoria;
  }
  public void setId_categoria(int id_categoria) {
    this.id_categoria = id_categoria;
  }

  public int getId_colaborador() {
    return id_colaborador;
  }
  public void setId_colaborador(int id_colaborador) {
    this.id_colaborador = id_colaborador;
  }

  public String getNome() {
    return nome;
  }
  public void setNome(String nome) {
    this.nome = nome;
  }

  public String getSexo() {
    return sexo;
  }
  public void setSexo(String sexo) {
    this.sexo = sexo;
  }

  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }

  public String getCPF() {
    return CPF;
  }
  public void setCPF(String CPF) {
    this.CPF = CPF;
  }

  public String getCelular() {
    return celular;
  }
  public void setCelular(String celular) {
    this.celular = celular;
  }

  public String getTelResidencial() {
    return telResidencial;
  }
  public void setTelResidencial(String telResidencial) {
    this.telResidencial = telResidencial;
  }

  public String getTelComercial() {
    return telComercial;
  }
  public void setTelComercial(String telComercial) {
    this.telComercial = telComercial;
  }

  public String getEstadoCivil() {
    return estadoCivil;
  }
  public void setEstadoCivil(String estadoCivil) {
    this.estadoCivil = estadoCivil;
  }

  public String getObs() {
    return obs;
  }
  public void setObs(String obs) {
    this.obs = obs;
  }

  public Date getDataNascimento() {
    return dataNascimento;
  }
  public void setDataNascimento(Date dataNascimento) {
    this.dataNascimento = dataNascimento;
  }

  public Date getData_() {
    return data_;
  }
  public void setData_(Date data_) {
    this.data_ = data_;
  }
}

