; See https://msdn.microsoft.com/en-us/library/windows/desktop/ms534495(v=vs.85).aspx
class Rect
{
	__New(params*)
	{
		c := params.MaxIndex()
		if (c == 4)
		{
			this.x := params[1]
			this.y := params[2]
			this.width := params[3]
			this.height := params[4]
		}
		else if (c == 2)
		{
			if ((params[1].__Class == "Gdip.Point") && (params[2].__Class == "Gdip.Size")) {
				this.x := params[1].x
				this.y := params[1].y
				this.width := params[2].width
				this.height := params[2].height
			}
			Else
				throw "Wrong parameter types for Rect New()"
		}
		else
			throw "Incorrect number of parameters for Rect.New()"

	}
	clone() {
		r := new Gdip.Rect(this.x, this.y, this.width, this.height)
		return r
	}
	contains(params*) {
		c := params.MaxIndex()
		if (c == 1) {
			if (params[1].__Class == "Gdip.Point") {
					return this.contains(params[1].x, params[1].y)
			}
			if (params[1].__Class == "Gdip.Rect") {
				x := params[1].x
				y := params[1].y
				width := params[1].width
				height := params[1].height
				if ((x >= this.x) && ((x + width) <= (this.x + this.width)) && (y >= this.y) && ((y + height) <= (this.y + this.height))) {
					return true
				}
			}
		} else if (c == 2) {
			x := params[1]
			y := params[2]
			if ((x >= this.x) && (x <= (this.x + this.width)) && (y >= this.y) && (y <= (this.y + this.width))) {
				return true
			}
		}
		return false
	}
	equals(params*) {
		c := params.MaxIndex()
		if (c = 1) {
			if (params[1].__Class == "Gdip.Rect") {
				if ((params[1].x == this.x) && (params[1].y == this.y) && (params[1].width == this.width) && (params[1].height == this.height)) {
					return true
				}
			}
		}
		return false
	}
	getBottom() {
		return (this.y + this.height)
	}
	getBounds() {
		return this.clone()
	}
	getLeft() {
		return (this.x)
	}
	getLocation() {
		pt := new Gdip.Point(this.x, this.y)
		return pt
	}
	getRight() {
		return (this.x + this.width)
	}
	getSize() {
		sz := new Gdip.Size(this.width, this.height)
		return sz
	}
	getTop() {
		return (this.y)
	}
	inflate(params*) {
		c := params.MaxIndex()
		if (c = 1) {
			if (params[1].__Class == "Gdip.Point") {
				this.inflate(params[1].x, params[1].y)
			}
		}
		else if (c = 2) {
			this.x := this.x - params[1]
			this.y := this.y - params[2]
			this.width := this.width + 2*params[1]
			this.height := this.height + 2*params[2]
		}
	}
	intersect(params *) {
		c := params.MaxIndex()
		if (c = 1) {
			if (params[1].__Class == "Gdip.Rect") {
				right := (this.getRight() < params[1].getRight())?this.getRight():params[1].getRight()
				left := (this.getLeft() > params[1].getLeft())?this.getLeft():params[1].getLeft()
				bottom := (this.getBottom() < params[1].getBottom())?this.getBottom():params[1].getBottom()
				top := (this.getTop() > params[1].getTop())?this.getTop():params[1].getTop()
				this.x := left
				this.y := top
				this.width := right-left
				this.height := bottom-top
				return (!this.isEmptyArea())
			}
		}
		return false
	}
	intersectsWith(params *) {
		c := params.MaxIndex()
		if (c = 1) {
			if (params[1].__Class == "Gdip.Rect") {
				return  ((this.GetLeft() < params[1].GetRight()) && (this.GetTop() < params[1].GetBottom()) && (this.GetRight() > params[1].GetLeft()) && (this.GetBottom() > params[1].GetTop()))
			}
		}
		return false
	}
	isEmptyArea() {
		return (this.width <= 0) || (this.height <= 0)
	}
	offset(params*) {
		c := params.MaxIndex()
		if (c = 1) {
			if (params[1].__Class == "Gdip.Point") {
				this.offset(params[1].x, params[1].y)
			}
		}
		else if (c = 2) {
			this.x := this.x + params[1]
			this.y := this.y + params[2]
		}
		return false
	}
	union(params *) {
		c := params.MaxIndex()
		if (c = 1) {
			if (params[1].__Class == "Gdip.Rect") {
				right := (this.getRight() > params[1].getRight())?this.getRight():params[1].getRight()
				left := (this.getLeft() < params[1].getLeft())?this.getLeft():params[1].getLeft()
				bottom := (this.getBottom() > params[1].getBottom())?this.getBottom():params[1].getBottom()
				top := (this.getTop() < params[1].getTop())?this.getTop():params[1].getTop()
				this.x := left
				this.y := top
				this.width := right-left
				this.height := bottom-top
				return (!this.isEmptyArea())
			}
		}
		return false
	}
}