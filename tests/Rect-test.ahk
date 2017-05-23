class RectTest extends AhkUnit {
	beforeEach() {
		this.x := 123
		this.y := 456
		this.width := 10
		this.height := 20
		
		this.dx := 10
		this.dy := 20
		
		this.pt := new Gdip.Point(this.x, this.y)
		this.sz := new Gdip.Size(this.width, this.height)
	}

	constructor() {
		d := this.describe("Gdip.Rect.Constructor")
		; --------------------------------------------------------------------------
		r := new Gdip.Rect(this.x, this.y, this.width, this.height)
		d.it("X should be " this.x " but is " r.x).expect(r.x == this.x).toBeTruthy()
		d.it("Y should be " this.y " but is " r.y).expect(r.y == this.y).toBeTruthy()
		d.it("Width should be " this.width " but is " r.width).expect(r.width == this.width).toBeTruthy()
		d.it("Height should be " this.height " but is " r.height).expect(r.height == this.height).toBeTruthy()
		; --------------------------------------------------------------------------
		r := new Gdip.Rect(this.pt,this.sz)
		d.it("X should be " this.pt.x " but is " r.x).expect(r.x == this.pt.x).toBeTruthy()
		d.it("Y should be " this.pt.y " but is " r.y).expect(r.y == this.pt.y).toBeTruthy()
		d.it("Width should be " this.sz.width " but is " r.width).expect(r.width == this.sz.width).toBeTruthy()
		d.it("Height should be " this.sz.height " but is " r.height).expect(r.height == this.sz.height).toBeTruthy()
	}
	
	clone() {
		d := this.describe("Gdip.Rect.Clone")
		; --------------------------------------------------------------------------
		r := new Gdip.Rect(this.x,this.y,this.width,this.height)
		r2 := r.clone()
		d.it("Rect should be " JSON.Dump(r2) " but is " JSON.Dump(r) ).expect((r.x == r2.x) && (r.y == r2.y) && (r.width == r2.width) && (r.height == r2.height)).toBeTruthy()
	}
	
	contains() {
		d := this.describe("Gdip.Rect.Contains")
		r := new Gdip.Rect(this.x,this.y,this.width,this.height)
	
		; --------------------------------------------------------------------------
		d.it("Rect " JSON.Dump(r) " should contain (" this.x+1 "," this.x+1 ")").expect(r.contains((this.x+1) ,(this.y+1))).toBeTruthy()
		; --------------------------------------------------------------------------
		ptTrue := new Gdip.Point(this.x+1 ,this.y+1)
		d.it("Rect " JSON.Dump(r) " should contain Point " JSON.Dump(ptTrue)).expect(r.contains(ptTrue)).toBeTruthy()
		; --------------------------------------------------------------------------
		rTrue := new Gdip.Rect(this.x+1,this.y+1,this.width-2,this.height-2)
		d.it("Rect " JSON.Dump(r) " should contain Rect " JSON.Dump(rTrue)).expect(r.contains(rTrue)).toBeTruthy()
		; --------------------------------------------------------------------------
		d.it("Rect " JSON.Dump(r) " shouldn't contain (" this.x-1 "," this.x-1 ")").expect(r.contains((this.x-1) ,(this.y-1))).toBeFalsy()
		;--------------------------------------------------------------------------
		ptFalse := new Gdip.Point(this.x-1 ,this.y-1)
		d.it("Rect " JSON.Dump(r) " shouldn't contain Point " JSON.Dump(ptFalse)).expect(r.contains(ptFalse)).toBeFalsy()
		; --------------------------------------------------------------------------
		rFalse := new Gdip.Rect(this.x-1,this.y-1,this.width+2,this.height+2)
		d.it("Rect " JSON.Dump(r) " shouldn't contain Rect " JSON.Dump(rFalse)).expect(r.contains(rFalse)).toBeFalsy()
	}
	
	equals() {
		d := this.describe("Gdip.Rect.Equals")
		r := new Gdip.Rect(this.x,this.y,this.width,this.height)
		r2 := new Gdip.Rect(this.x+1,this.y+1,this.width,this.height)
		d.it("Rect " JSON.Dump(r) " shouldn't be equal to Rect " JSON.Dump(r2)).expect(r.equals(r2)).toBeFalsy()
		d.it("Rect " JSON.Dump(r) " should be equal to Rect " JSON.Dump(r)).expect(r.equals(r)).toBeTruthy()
		
	}
	
	getBottom() {
		d := this.describe("Gdip.Rect.getBottom")
	  r := new Gdip.Rect(this.x,this.y,this.width,this.height)
		d.it("Bottom should be " (this.y + this.height) " but is " r.GetBottom()).expect(r.GetBottom() == (this.y + this.height)).toBeTruthy()
	}
	
	getBounds() {
		d := this.describe("Gdip.Rect.getBounds")
		r := new Gdip.Rect(this.x,this.y,this.width,this.height)
		r2 := r.getBounds()
		d.it("Rect " JSON.Dump(r) " should be equal to Rect " JSON.Dump(r2)).expect((r.x == r2.x) && (r.y == r2.y) && (r.width == r2.width) && (r.height == r2.height)).toBeTruthy()
	}
	
	getLeft() {
		d := this.describe("Gdip.Rect.getLeft")
		r := new Gdip.Rect(this.x,this.y,this.width,this.height)
		d.it("Left should be " (this.x) " but is " r.GetLeft()).expect(r.GetLeft() == (this.x)).toBeTruthy()
	}
	
	getLocation() {
		d := this.describe("Gdip.Rect.getLocation")
		r := new Gdip.Rect(this.x,this.y,this.width,this.height)
		loc := r.getLocation()
		d.it("Location should be (" (this.x) "," this.y ") but is " JSON.Dump(loc)).expect((loc.x == this.x) && (loc.y == this.y)).toBeTruthy()
	}
	
	getRight() {
		d := this.describe("Gdip.Rect.getRight")
		r := new Gdip.Rect(this.x,this.y,this.width,this.height)
		d.it("Right should be " (this.x + this.width) " but is " r.GetRight()).expect(r.GetRight() == (this.x + this.width)).toBeTruthy()
	}
	
	getSize() {
		d := this.describe("Gdip.Rect.getSize")
		r := new Gdip.Rect(this.x,this.y,this.width,this.height)
		sz := r.getSize()
		d.it("Size should be (" (this.width) "," this.height ") but is " JSON.Dump(sz)).expect((sz.width == this.width) && (sz.height == this.height)).toBeTruthy()
	}
	
	getTop() {
		d := this.describe("Gdip.Rect.getTop")
		r := new Gdip.Rect(this.x,this.y,this.width,this.height)
		d.it("Top should be " (this.y) " but is " r.GetTop()).expect(r.GetTop() == (this.y)).toBeTruthy()
	}
	
	inflate() {
		d := this.describe("Gdip.Rect.inflate")
		; Inflated Rect
		r2 := new Gdip.Rect((this.x - this.dx), (this.y - this.dy), (this.width+2*this.dx), (this.height+2*this.dy))

		r := new Gdip.Rect(this.x,this.y,this.width,this.height)
		r.Inflate(this.dx, this.dy)
		d.it("(1) Rect " JSON.Dump(r) " should be equal to Rect " JSON.Dump(r2)).expect((r.x == r2.x) && (r.y == r2.y) && (r.width == r2.width) && (r.height == r2.height)).toBeTruthy()

		r := new Gdip.Rect(this.x,this.y,this.width,this.height)
		pt := new Gdip.Point(this.dx, this.dy)
		r.Inflate(pt)
		d.it("(2) Rect " JSON.Dump(r) " should be equal to Rect " JSON.Dump(r2)).expect((r.x == r2.x) && (r.y == r2.y) && (r.width == r2.width) && (r.height == r2.height)).toBeTruthy()
	}
	
	intersect() {
		d := this.describe("Gdip.Rect.intersectX")
		r := new Gdip.Rect(this.x,this.y,this.width,this.height)
		r2 := new Gdip.Rect(this.x+1,this.y+1,this.width,this.height)
		; Expected rectangle from intersection
		rRes := new Gdip.Rect(this.x+1,this.y+1,this.width-1,this.height-1)
		d.it("(1) Rect " JSON.Dump(r) " intersect with " JSON.Dump(r2) " should be true").expect(r.intersect(r2)).toBeTruthy()
		d.it("Intersected Rect " JSON.Dump(r) " should be equal to Rect " JSON.Dump(rRes)).expect((r.x = rRes.x) && (r.y == rRes.y) && (r.width == rRes.width) && (r.height == rRes.height)).toBeTruthy()

		; No intersectio between r and r2
		r2 := new Gdip.Rect(this.x+this.width+1,this.y+this.height+1,this.width,this.height)
		d.it("(2) Rect " JSON.Dump(r) " intersect with " JSON.Dump(r2) " should be true").expect(r.intersect(r2)).toBeFalsy()
	}
	
	intersectsWith() {
		d := this.describe("Gdip.Rect.intersectsWith")
		r := new Gdip.Rect(this.x,this.y,this.width,this.height)
		r2 := new Gdip.Rect(this.x+1,this.y+1,this.width,this.height)
		d.it("(1) Rect " JSON.Dump(r) " intersects with " JSON.Dump(r2) " should be true").expect(r.intersectsWith(r2)).toBeTruthy()
		
		r2 := new Gdip.Rect(this.x+1,this.y+1,this.width-2,this.height-2)
		d.it("(2) Rect " JSON.Dump(r) " intersects with " JSON.Dump(r2) " should be true").expect(r.intersectsWith(r2)).toBeTruthy()

		r2 := new Gdip.Rect(this.x,this.y,this.width,this.height)
		d.it("(3) Rect " JSON.Dump(r) " intersects with " JSON.Dump(r2) " should be true").expect(r.intersectsWith(r2)).toBeTruthy()

		r2 := new Gdip.Rect(this.x+this.width,this.y+this.height,this.width,this.height)
		d.it("(4) Rect " JSON.Dump(r) " intersects with " JSON.Dump(r2) " should be false").expect(r.intersectsWith(r2)).toBeFalsy()
		
	}
	isEmptyArea() {
		d := this.describe("Gdip.Rect.isEmptyArea")
		; --------------------------------------------------------------------------
		r := new Gdip.Rect(this.x,this.y,this.width,this.height)
		d.it("Rect " JSON.Dump(r) " shouldn't be empty area").expect(r.isEmptyArea()).toBeFalsy()
		; --------------------------------------------------------------------------
		r := new Gdip.Rect(this.x,this.y,0,0)
		d.it("Rect " JSON.Dump(r) " shouldn be empty area").expect(r.isEmptyArea()).toBeTruth()
	}
	offset() {
		d := this.describe("Gdip.Rect.offset")
		r := new Gdip.Rect(this.x,this.y,this.width,this.height)
		
		r.Offset(this.dx, this.dy)
		; Expected resulting rect
		rRes := new Gdip.Rect(this.x + this.dx,this.y + this.dy,this.width,this.height)
		d.it("(1) Rect " JSON.Dump(r) " should be equal to Rect " JSON.Dump(rRes)).expect((r.x = rRes.x) && (r.y == rRes.y) && (r.width == rRes.width) && (r.height == rRes.height)).toBeTruthy()

		r := new Gdip.Rect(this.x,this.y,this.width,this.height)
		pt := new Gdip.Point(this.dx, this.dy)
		r.offset(pt)
		d.it("(2) Rect " JSON.Dump(r) " should be equal to Rect " JSON.Dump(rRes)).expect((r.x = rRes.x) && (r.y == rRes.y) && (r.width == rRes.width) && (r.height == rRes.height)).toBeTruthy()
	}
	
	union() {
		d := this.describe("Gdip.Rect.union")
		r := new Gdip.Rect(this.x,this.y,this.width,this.height)
		r2 := new Gdip.Rect(this.x+1,this.y+1,this.width,this.height)
		res := r.union(r2)
		
		; Expected resulting rect
		rRes := new Gdip.Rect(this.x,this.y,this.width+1,this.height+1)
		d.it("(1) Rect " JSON.Dump(r) " should be equal to Rect " JSON.Dump(rRes)).expect((r.x = rRes.x) && (r.y == rRes.y) && (r.width == rRes.width) && (r.height == rRes.height)).toBeTruthy()
			
		r := new Gdip.Rect(this.x,this.y,this.width,this.height)
		r2 := new Gdip.Rect(this.x+this.width,this.y+this.height,this.width,this.height)
		res := r.union(r2)
		; Expected resulting rect
		rRes := new Gdip.Rect(this.x,this.y, 2 * this.width, 2 * this.height)
		d.it("(1) Rect " JSON.Dump(r) " should be equal to Rect " JSON.Dump(rRes)).expect((r.x = rRes.x) && (r.y == rRes.y) && (r.width == rRes.width) && (r.height == rRes.height)).toBeTruthy()
	}
}