# bubble, insertion, recursive insertion, merge, rec merge

# bubble sort
def bubble_sort(array)
  swapped = false
  for i in 0..(array.length-2)
    if array[i] > array[i + 1]
      temp = array[i + 1]
      array[i + 1] = array[i]
      array[i] = temp
      swapped = true
    end
  end
  if(swapped)
    bubble_sort(array)
  end
  array
end

# insertion sort
def insertion_sort(array)
  i = 1
  while i < array.length
      x = array[i]
      j = i - 1
      while j >= 0 and array[j] > x
          array[j+1] = array[j]
          j = j - 1
      end
      array[j+1] = x
      i = i + 1
  end
  array
end

# recursive insertion sort
def insertion_sort_rec(array)
  insertion_rec_helper(array, array.length-1)
end

def insertion_rec_helper(array, n)
  if n > 0
     insertion_rec_helper(array,n-1)
     x = array[n]
     j = n-1
     while j >= 0 and array[j] > x
         array[j+1] = array[j]
         j = j-1
     end
     array[j+1] = x
  end
  array
end

# selection sort
def selection_sort(array)
  # advance the position through the entire array
  for j in 0..(array.length-1)
      # find the min element in the unsorted a[j .. n-1]

      # assume the min is the first element
      min_index = j
      # test against elements after j to find the smallest
      for i in (j+1)..(array.length-1)
          # if this element is less, then it is the new minimum
          if (array[i] < array[min_index])
              # found new minimum; remember its index
              min_index = i
          end
      end

      if (min_index != j)
          temp = array[j]
          array[j] = array[min_index]
          array[min_index] = temp
      end
  end
  array
end

# Iteratively merg sort array A[low..high]
def merge_sort(array)
    low = 0
    high = array.length - 1

    # // divide the array into blocks of size m
    # // m = [1, 2, 4, 8, 16...]
    m = 1
    while m <= (high-low)
        i = low
        while i < high
            from = i
            mid = i + m - 1
            if i + (2 * m) - 1 < high
              to = i + (2 * m) - 1
            else
              to = high
            end

            array = merge(array, from, mid, to)
            i = i + (2*m)
        end
        m = 2*m
    end
    array
end

# iterative merge sort helper
def merge(array, from, mid, to)
    k = from
    i = from
    j = mid + 1
    temp = []

    # loop till there are elements in the left and right runs
    while (i <= mid && j <= to)
        if (array[i] < array[j])
            temp[k] = array[i]
            i = i+1
            k = k+1
        else
            temp[k] = array[j]
            j = j+1
            k = k+1
        end
    end

    # Copy remaining elements
    while i <= mid
        temp[k] = array[i]
        i = i+1
        k = k+1
    end

    while j <= to
        temp[k] = array[j]
        j = j+1
        k = k+1
    end

    # copy back to the original array to reflect sorted order
    for i in from..to
        array[i] = temp[i]
    end
    array
end

#recursive merge sort
def merge_sort_rec(array)
  if array.length > 1
      mid = array.length/2
      lefthalf = array[0..mid-1]
      righthalf = array[mid..array.length-1]

      lefthalf = merge_sort_rec(lefthalf)
      righthalf = merge_sort_rec(righthalf)

      i=0
      j=0
      k=0
      while i < lefthalf.length and j < righthalf.length
          if lefthalf[i] < righthalf[j]
              array[k] = lefthalf[i]
              i = i+1
          else
              array[k] = righthalf[j]
              j = j+1
          end
          k = k+1
      end
      while i < lefthalf.length
          array[k] = lefthalf[i]
          i = i+1
          k = k+1
      end
      while j < righthalf.length
          array[k] = righthalf[j]
          j = j+1
          k = k+1
      end
  end
  array
end

# quicksort
# quicksort starter
def quick_sort(array)
  quicksort(array, 0, array.length - 1)
end

#recursive quicksort call
def quicksort(array, lo, hi)
    if lo < hi
        part = partition(array, lo, hi)
        quicksort(array, lo, part - 1 )
        quicksort(array, part + 1, hi)
    end
    array
end

# pivots around partion
def partition(array, lo, hi)
    pivot = array[hi]
    i = lo - 1
    for j in lo..(hi-1)
        if array[j] < pivot
            i = i + 1
            temp = array[j]
            array[j] = array[i]
            array[i] = temp
        end
    end
    temp = array[i+1]
    array[i+1] = array[hi]
    array[hi] = temp
    return i + 1
end

# sets an array for sorts to run on
def given
  [6,5,3,1,8,7,2,3]
end

puts bubble_sort(given).join(' ')
puts insertion_sort(given).join(' ')
puts insertion_sort_rec(given).join(' ')
puts selection_sort(given).join(' ')
puts merge_sort(given).join(' ')
puts merge_sort_rec(given).join(' ')
puts quick_sort(given).join(' ')
