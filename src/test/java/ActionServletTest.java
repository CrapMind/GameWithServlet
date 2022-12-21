import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

import static org.mockito.Mockito.*;

public class ActionServletTest {
    public static final HttpSession session = mock(HttpSession.class);
    final RequestDispatcher dispatcher = mock(RequestDispatcher.class);
    final HttpServletRequest request = mock(HttpServletRequest.class);
    final HttpServletResponse response = mock(HttpServletResponse.class);


    @Test
    public void whenCallDoGetThenServletReturnJsp() throws ServletException, IOException {
        when(request.getSession()).thenReturn(session);
        when(request.getRequestDispatcher("action.jsp")).thenReturn(dispatcher);

    }
    @Test
    public void whenUserInputNameParamThenSessionTakeIt() {
        String name = request.getParameter("name");
        verify(session).setAttribute("name", name);
    }
}
