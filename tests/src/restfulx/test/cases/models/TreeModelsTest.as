/*******************************************************************************
 * Copyright (c) 2008-2009 Dima Berastau and Contributors
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * Redistributions of files must retain the above copyright notice.
 ******************************************************************************/
package restfulx.test.cases.models {
  import org.restfulx.Rx;
  import org.restfulx.collections.ModelsCollection;
  import org.restfulx.utils.TypedArray;
  
  import restfulx.test.RxTestCase;
  import restfulx.test.models.Category;

  public class TreeModelsTest extends RxTestCase {
    public function TreeModelsTest(methodName:String, serviceProviderId:int) {
      super(methodName, serviceProviderId);
    }

    public function testTreeModelIndex():void {
      establishService();
      Rx.models.index(Category, onIndex);      
    }
    
    private function onIndex(result:TypedArray):void {
      var categories:ModelsCollection = Rx.models.cached(Category);
      
      var firstCategory:Category = categories.withId("8451967") as Category;
      assertEquals(4, categories.length);
      assertNull(firstCategory.parent);
      assertEquals(2, firstCategory.children.length);
      assertEquals("Category1NameString", firstCategory.name);
      assertEquals("Category2NameString", Category(firstCategory.children.withId("51659203")).name);
    }
  }
}