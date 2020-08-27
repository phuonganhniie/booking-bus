package interf;

public class Local {
private int id;
private String name;
private String routeimg;
public Local() {
	super();
	
}
public Local(int id, String name, String routeimg) {
	super();
	this.id = id;
	this.name = name;
	this.routeimg = routeimg;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getRouteimg() {
	return routeimg;
}
public void setRouteimg(String routeimg) {
	this.routeimg = routeimg;
}

}
