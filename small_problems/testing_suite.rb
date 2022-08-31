def test_odd?
  assert_equal(true, value.odd?)
end

def test_downcase?
  assert_equal('xyx', value.downcase)
end

def test_nil
  assert_nil(value)
end

def test_empty?
  assert_empty(list)
end

def test_include
  assert_includes(list, 'xyz')
end

def test_hire_exception
  assert_raises(NoExperienceError) { employee.hire }
end

def test_instance_of_numeric
  assert_instance_of(Numeric, value)
end

def test_kind_of_numeric
  assert_kind_of(Numeric, value)
end

def test_same
  assert_same(list, list.process)
end

def test_refute_included
  refute_includes(list, 'xyz')
end