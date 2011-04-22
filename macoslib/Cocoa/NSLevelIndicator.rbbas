#tag ClassClass NSLevelIndicatorInherits NSControl	#tag Event		Function NSClassName() As String		  return "NSLevelIndicator"		End Function	#tag EndEvent	#tag Event		Sub Open()		  self.CriticalValue = self.initialcriticalvalue		  self.MaxValue = self.initialmaxvalue		  self.MinValue = self.initialminvalue		  self.Value = self.initialvalue		  self.WarningValue = self.initialwarningvalue		  self.Style = self.initialstyle		  		  raiseEvent Open		End Sub	#tag EndEvent	#tag Method, Flags = &h21		Private Function GetCriticalValue() As Double		  #if targetCocoa		    soft declare function criticalValue lib CocoaFramework selector "criticalValue" (id as Ptr) as Double		    		    return criticalValue(self.id)		  #endif		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Function GetMaxValue() As Double		  #if targetCocoa		    soft declare function maxValue lib CocoaFramework selector "maxValue" (id as Ptr) as Double		    		    return maxValue(self.id)		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Function GetMinValue() As Double		  #if targetCocoa		    soft declare function minValue lib CocoaFramework selector "minValue" (id as Ptr) as Double		    		    return minValue(self.id)		  #endif		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Function GetValue(ValueGetter as ValueGetterDelegate, initial_value as Double) As Double		  #if targetCocoa		    if self.id <> nil then		      return ValueGetter.Invoke()		    else		      return initial_value		    end if		  #endif		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Function GetWarningValue() As Double		  #if targetCocoa		    soft declare function warningValue lib CocoaFramework selector "warningValue" (id as Ptr) as Double		    		    return warningValue(self.id)		  #endif		  		End Function	#tag EndMethod	#tag DelegateDeclaration, Flags = &h21		Private Delegate Function ValueGetterDelegate() As Double	#tag EndDelegateDeclaration	#tag Hook, Flags = &h0		Event Open()	#tag EndHook	#tag ComputedProperty, Flags = &h0		#tag Getter			Get			  return self.GetValue(AddressOf GetCriticalValue, self.initialcriticalvalue)			End Get		#tag EndGetter		#tag Setter			Set			  #if targetCocoa			    if self.id <> nil then			      soft declare sub setCriticalValue lib CocoaFramework selector "setCriticalValue:"  (id as Ptr, criticalValue as Double)			      			      setCriticalValue self.id, value			    else			      self.initialcriticalvalue = value			    end if			  #endif			End Set		#tag EndSetter		CriticalValue As Double	#tag EndComputedProperty	#tag Property, Flags = &h21		Attributes( HIdden = true ) Private initialcriticalvalue As Double	#tag EndProperty	#tag Property, Flags = &h21		Attributes( Hidden = true ) Private initialmaxvalue As Double	#tag EndProperty	#tag Property, Flags = &h21		Private initialminvalue As Double	#tag EndProperty	#tag Property, Flags = &h21		Private initialstyle As Integer	#tag EndProperty	#tag Property, Flags = &h21		Private initialvalue As Double	#tag EndProperty	#tag Property, Flags = &h21		Private initialwarningvalue As Double	#tag EndProperty	#tag ComputedProperty, Flags = &h0		#tag Getter			Get			  #if targetCocoa			    if me.id <> nil then			      soft declare function numberOfMajorTickMarks lib CocoaFramework selector "numberOfMajorTickMarks" (id as Ptr) as Integer			      			      return numberOfMajorTickMarks(me.id)			    else			      return 0			    end if			  #endif			End Get		#tag EndGetter		#tag Setter			Set			  #if targetCocoa			    if me.id <> nil then			      soft declare sub setNumberOfMajorTickMarks lib CocoaFramework selector "setNumberOfMajorTickMarks:" (id as Ptr, count as Integer)			      			      setNumberOfMajorTickMarks me.id, value			      			    else			      return			    end if			  #endif			End Set		#tag EndSetter		MajorTickMarks As Integer	#tag EndComputedProperty	#tag ComputedProperty, Flags = &h0		#tag Getter			Get			  return self.GetValue(AddressOf GetMaxValue, self.initialmaxvalue)			End Get		#tag EndGetter		#tag Setter			Set			  #if targetCocoa			    if self.id <> nil then			      soft declare sub setMaxValue lib CocoaFramework selector "setMaxValue:"  (id as Ptr, maxValue as Double)			      			      setMaxValue self.id, value			    else			      self.initialmaxvalue = value			    end if			  #endif			End Set		#tag EndSetter		MaxValue As Double	#tag EndComputedProperty	#tag ComputedProperty, Flags = &h0		#tag Getter			Get			  return self.GetValue(AddressOf GetMinValue, self.initialminvalue)			End Get		#tag EndGetter		#tag Setter			Set			  #if targetCocoa			    if self.id <> nil then			      soft declare sub setMinValue lib CocoaFramework selector "setMinValue:"  (id as Ptr, minValue as Double)			      			      setMinValue self.id, value			    else			      self.initialminvalue = value			    end if			  #endif			End Set		#tag EndSetter		MinValue As Double	#tag EndComputedProperty	#tag ComputedProperty, Flags = &h0		#tag Getter			Get			  #if targetCocoa			    if self.id <> nil then			      dim cell_id as Ptr = self.Cell			      if cell_id = nil then			        return 0			      end if			      			      soft declare function levelIndicatorStyle lib CocoaFramework selector "levelIndicatorStyle" (id as Ptr) as Integer			      			      return levelIndicatorStyle(cell_id)			      			    else			      return self.initialstyle			    end if			  #endif			End Get		#tag EndGetter		#tag Setter			Set			  #if targetCocoa			    if self.id <> nil then			      dim cell_id as Ptr = self.Cell			      if cell_id = nil then			        //I think this shouldn't happen; if it does, I just return.			        return			      end if			      			      soft declare sub setLevelIndicatorStyle lib CocoaFramework selector "setLevelIndicatorStyle:"  (id as Ptr, levelIndicatorStyle as Integer)			      			      setLevelIndicatorStyle cell_id, value			      			    else			      self.initialstyle = value			    end if			  #endif			End Set		#tag EndSetter		Style As Integer	#tag EndComputedProperty	#tag ComputedProperty, Flags = &h0		#tag Getter			Get			  #if targetCocoa			    if me.id <> nil then			      soft declare function numberOfTickMarks lib CocoaFramework selector "numberOfTickMarks" (id as Ptr) as Integer			      			      return numberOfTickMarks(me.id)			    else			      return 0			    end if			  #endif			End Get		#tag EndGetter		#tag Setter			Set			  #if targetCocoa			    if me.id <> nil then			      soft declare sub setNumberOfTickMarks lib CocoaFramework selector "setNumberOfTickMarks:" (id as Ptr, count as Integer)			      			      setNumberOfTickMarks me.id, value			      			    else			      return			    end if			  #endif			End Set		#tag EndSetter		TickMarks As Integer	#tag EndComputedProperty	#tag ComputedProperty, Flags = &h0		#tag Getter			Get			  return self.GetValue(AddressOf self.DoubleValue, self.initialvalue)			End Get		#tag EndGetter		#tag Setter			Set			  if self.id <> nil then			    self.DoubleValue = value			  else			    self.initialvalue = value			  end if			End Set		#tag EndSetter		Value As Double	#tag EndComputedProperty	#tag ComputedProperty, Flags = &h0		#tag Getter			Get			  return self.GetValue(AddressOf GetWarningValue, self.initialwarningvalue)			End Get		#tag EndGetter		#tag Setter			Set			  #if targetCocoa			    if self.id <> nil then			      soft declare sub setWarningValue lib CocoaFramework selector "setWarningValue:"  (id as Ptr, warningValue as Double)			      			      setWarningValue self.id, value			    else			      self.initialwarningvalue = value			    end if			  #endif			End Set		#tag EndSetter		WarningValue As Double	#tag EndComputedProperty	#tag Constant, Name = CocoaFramework, Type = String, Dynamic = False, Default = \"Cocoa.framework", Scope = Private	#tag EndConstant	#tag Constant, Name = ContinuousCapacityLevelIndicator, Type = Double, Dynamic = False, Default = \"1", Scope = Public	#tag EndConstant	#tag Constant, Name = DiscreteCapacityLevelIndicator, Type = Double, Dynamic = False, Default = \"2", Scope = Public	#tag EndConstant	#tag Constant, Name = RatingLevelIndicator, Type = Double, Dynamic = False, Default = \"3", Scope = Public	#tag EndConstant	#tag Constant, Name = RelevancyLevelIndicator, Type = Double, Dynamic = False, Default = \"0", Scope = Public	#tag EndConstant	#tag ViewBehavior		#tag ViewProperty			Name="AcceptFocus"			Group="Behavior"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="AcceptTabs"			Group="Behavior"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="AutoDeactivate"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Backdrop"			Visible=true			Group="Appearance"			Type="Picture"			EditorType="Picture"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="CriticalValue"			Visible=true			Group="Behavior"			Type="Double"		#tag EndViewProperty		#tag ViewProperty			Name="DoubleBuffer"			Group="Behavior"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Enabled"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="EraseBackground"			Group="Behavior"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Height"			Visible=true			Group="Position"			InitialValue="100"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="HelpTag"			Visible=true			Group="Appearance"			Type="String"			EditorType="MultiLineEditor"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			Type="Integer"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="InitialParent"			Group="Initial State"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="IsFlipped"			Group="Behavior"			Type="Boolean"			InheritedFrom="NSControl"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="LockBottom"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="LockLeft"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="LockRight"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="LockTop"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="MajorTickMarks"			Group="Behavior"			Type="Integer"		#tag EndViewProperty		#tag ViewProperty			Name="MaxValue"			Visible=true			Group="Behavior"			Type="Double"		#tag EndViewProperty		#tag ViewProperty			Name="MinValue"			Visible=true			Group="Behavior"			Type="Double"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Style"			Visible=true			Group="Behavior"			Type="Integer"			EditorType="Enum"			#tag EnumValues				"0 - RelevancyLevelIndicator"				"1 - ContinuousCapacityLevelIndicator"				"2 - DiscreteCapacityLevelIndicator"				"3 - RatingLevelIndicator"			#tag EndEnumValues		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="TabIndex"			Group="Position"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="TabPanelIndex"			Group="Position"			InitialValue="0"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="TabStop"			Group="Position"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="TickMarks"			Group="Behavior"			Type="Integer"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="UseFocusRing"			Group="Appearance"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Value"			Visible=true			Group="Behavior"			Type="Double"		#tag EndViewProperty		#tag ViewProperty			Name="Visible"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="WarningValue"			Visible=true			Group="Behavior"			Type="Double"		#tag EndViewProperty		#tag ViewProperty			Name="Width"			Visible=true			Group="Position"			InitialValue="100"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass